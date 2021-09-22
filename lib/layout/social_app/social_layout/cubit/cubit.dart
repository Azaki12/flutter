import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/layout/social_app/social_layout/cubit/states.dart';
import 'package:login/model/social_app/message_model.dart';
import 'package:login/model/social_app/post_model.dart';
import 'package:login/model/social_app/social_user_model.dart';
import 'package:login/module/social_app/chats_screen/chats_screen.dart';
import 'package:login/module/social_app/feeds_screen/feeds_screen.dart';
import 'package:login/module/social_app/new_post_screen/new_post_screen.dart';
import 'package:login/module/social_app/setting_screen/settings_screen.dart';
import 'package:login/module/social_app/users_screen/users_screen.dart';
import 'package:login/shared/component/constants.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  SocialUserModel userModel;
  MessageModel messageModel;

  void getUserData() {
    emit(SocialGetUserLoadingState());

    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data()['image']);
      userModel = SocialUserModel.fromJson(value.data());
      emit(SocialGetUserSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(SocialGetUserErrorState(onError.toString()));
    });
  }

  int currentIndex = 0;

  List<Widget> screens = [
    FeedsScreen(),
    ChatsScreen(),
    NewPostScreen(),
    UsersScreen(),
    SettingsScreen(),
  ];
  List<String> titles = [
    'Home',
    'Chats',
    'Post',
    'Users',
    'Settings',
  ];

  void changeBottomNav(int index) {
    if (index == 2) {
      emit(SocialNewPostState());
    } else {
      currentIndex = index;
      emit(SocialChangeBottomNavState());
    }
  }

  File profileImage;
  final picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(SocialProfileImagePickedSuccessState());
    } else {
      emit(SocialProfileImagePickedErrorState());
      print('No image selected');
    }
  }

  File coverImage;

  Future<void> getCoverImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(SocialCoverImagePickedSuccessState());
    } else {
      emit(SocialCoverImagePickedErrorState());
      print('No image selected');
    }
  }

  void uploadProfileImage({
    @required String name,
    @required String phone,
    @required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child(
          'users/${Uri.file(profileImage.path).pathSegments.last}',
        )
        .putFile(profileImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //emit(SocialUploadProfileImageSuccessState());
        updateUserData(
          name: name,
          phone: phone,
          bio: bio,
          image: value,
        );
      }).catchError((onError) {
        emit(SocialUploadProfileImageErrorState());
      });
    }).catchError((onError) {
      emit(SocialUploadProfileImageErrorState());
    });
  }

  void uploadCoverImage({
    @required String name,
    @required String phone,
    @required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child(
          'users/${Uri.file(coverImage.path).pathSegments.last}',
        )
        .putFile(coverImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //emit(SocialUploadCoverImageSuccessState());

        updateUserData(
          name: name,
          phone: phone,
          bio: bio,
          cover: value,
        );
      }).catchError((onError) {
        emit(SocialUploadCoverImageErrorState());
      });
    }).catchError((onError) {
      emit(SocialUploadCoverImageErrorState());
    });
  }

  String uploadedImage = '';

  void uploadChatImage() {
    emit(SocialChatImageUploadLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child(
          'chats/${Uri.file(chatImage.path).pathSegments.last}',
        )
        .putFile(chatImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(SocialChatImageUploadSuccessState());
        uploadedImage = value;
        print(uploadedImage);
      }).catchError((onError) {
        emit(SocialChatImageUploadErrorState());
      });
    }).catchError((onError) {
      emit(SocialChatImageUploadErrorState());
    });
  }

  // void updateUserImages({
  //   @required String name,
  //   @required String phone,
  //   @required String bio,
  // }) {
  //   emit(SocialUserUpdateLoadingState());
  //   if (coverImage != null) {
  //     uploadCoverImage();
  //   } else if (profileImage != null) {
  //     uploadProfileImage();
  //   } else if (coverImage != null && profileImage != null) {
  //   } else {
  //     updateUserData(
  //       name: name,
  //       phone: phone,
  //       bio: bio,
  //     );
  //   }
  // }

  void updateUserData({
    @required String name,
    @required String phone,
    @required String bio,
    String cover,
    String image,
  }) {
    SocialUserModel model = SocialUserModel(
      name: name,
      phone: phone,
      email: userModel.email,
      image: image ?? userModel.image,
      coverImage: cover ?? userModel.coverImage,
      uID: userModel.uID,
      bio: bio,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uID)
        .update(model.toMap())
        .then((value) {
      getUserData();
    }).catchError((onError) {
      print(userModel.uID);

      print(onError.toString());
      emit(SocialUserUpdateErrorState());
    });
  }

  File postImage;
  File chatImage;

  void removePostImage() {
    postImage = null;
    emit(SocialRemovePostImageState());
  }

  void removeChatImage() {
    chatImage = null;
    emit(SocialRemovePostImageState());
  }

  Future<void> getPostImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(SocialCoverImagePickedSuccessState());
    } else {
      emit(SocialCoverImagePickedErrorState());
      print('No image selected');
    }
  }

  Future<void> getChatImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      chatImage = File(pickedFile.path);
      emit(SocialChatImagePickedSuccessState());
    } else {
      emit(SocialChatImagePickedErrorState());
      print('No image selected');
    }
  }

  void uploadPostImage({
    @required String date,
    @required String text,
  }) {
    emit(SocialCreatePostLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage.path).pathSegments.last}')
        .putFile(postImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        createPost(date: date, text: text, postImage: value);
      }).catchError((onError) {
        emit(SocialCreatePostErrorState());
      });
    }).catchError((onError) {
      emit(SocialCreatePostErrorState());
    });
  }

  void createPost({
    @required String date,
    @required String text,
    String postImage,
  }) {
    emit(SocialCreatePostLoadingState());
    PostModel model = PostModel(
      name: userModel.name,
      image: userModel.image,
      uID: userModel.uID,
      date: date,
      postImage: postImage ?? '',
      text: text,
    );
    FirebaseFirestore.instance.collection('posts').add(model.toMap()).then(
      (value) {
        emit(SocialCreatePostSuccessState());
      },
    ).catchError((onError) {
      emit(SocialCreatePostErrorState());
    });
  }

  List<PostModel> posts = [];
  List<String> postId = [];
  List<int> likes = [];
  List<int> comment = [];
  List<SocialUserModel> users = [];

  void getUsers() {
    emit(SocialGetAllUsersLoadingState());
    if (users.length == 0)
      FirebaseFirestore.instance.collection('users').get().then((value) {
        value.docs.forEach(
          (element) {
            if (element.data()['uId'] != userModel.uID)
              users.add(SocialUserModel.fromJson(element.data()));
          },
        );
        emit(SocialGetAllUsersSuccessState());
      }).catchError(
        (onError) {
          emit(SocialGetAllUsersErrorState(onError.toString()));
        },
      );
  }

  void getPosts() {
    FirebaseFirestore.instance.collection('posts').get().then((value) {
      value.docs.forEach(
        (element) {
          element.reference.collection('likes').get().then((value) {
            likes.add(value.docs.length);
            posts.add(PostModel.fromJson(element.data()));
            postId.add(element.id);
          }).catchError((onError) {});

          element.reference.collection('comments').get().then((value) {
            comment.add(value.docs.length);
          }).catchError((onError) {});
        },
      );
      emit(SocialGetPostsSuccessState());
    }).catchError((onError) {
      emit(SocialGetPostsErrorState(onError.toString()));
    });
  }

  void likePost(String postId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(userModel.uID)
        .set(
      {
        'like': true,
      },
    ).then(
      (value) {
        emit(SocialLikePostsSuccessState());
      },
    ).catchError(
      (onError) {
        emit(SocialLikePostsErrorState(onError.toString()));
      },
    );
  }

  void commentPost(String postId, String comment) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .doc(userModel.uID)
        .set(
      {
        'comment': comment,
      },
    ).then(
      (value) {
        emit(SocialCommentPostsSuccessState());
      },
    ).catchError(
      (onError) {
        emit(SocialCommentPostsErrorState(onError.toString()));
      },
    );
  }

  void sendMessage({
    @required String dateTime,
    @required String receiverId,
    @required String text,
  }) {
    messageModel = MessageModel(
      text: text,
      senderId: userModel.uID,
      receiverId: receiverId,
      dateTime: dateTime,
      chatImage: uploadedImage,
    );

    // from 1st user to second

    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uID)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(messageModel.toMap())
        .then((value) {
      emit(SocialSendMessageSuccessState());
    }).catchError((onError) {
      emit(SocialSendMessageErrorState());
    });

    // from second to first
    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(userModel.uID)
        .collection('messages')
        .add(messageModel.toMap())
        .then((value) {
      emit(SocialSendMessageSuccessState());
    }).catchError((onError) {
      emit(SocialSendMessageErrorState());
    });
  }

  List<MessageModel> messages = [];

  void getMessages({
    @required String receiverId,
  }) {
    // using dateTime to order the messages

    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uID)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen(
      (event) {
        // to empty the list everytime the lister works
        messages = [];

        // to bring the messages into the model to display
        event.docs.forEach(
          (element) {
            messages.add(MessageModel.fromJson(element.data()));
          },
        );

        emit(SocialGetMessageSuccessState());
      },
    );
  }
}
