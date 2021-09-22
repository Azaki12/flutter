abstract class SocialStates {}

// cubit initialization

class SocialInitialState extends SocialStates {}

// get user method

class SocialGetUserSuccessState extends SocialStates {}

class SocialGetUserLoadingState extends SocialStates {}

class SocialGetUserErrorState extends SocialStates {
  final String error;

  SocialGetUserErrorState(this.error);
}

// change bottom nav method

class SocialChangeBottomNavState extends SocialStates {}

// create new post method

class SocialNewPostState extends SocialStates {}

// pick image methods

class SocialProfileImagePickedSuccessState extends SocialStates {}

class SocialProfileImagePickedErrorState extends SocialStates {}

// upload image methods

class SocialUploadProfileImageSuccessState extends SocialStates {}

class SocialUploadProfileImageErrorState extends SocialStates {}

// select cover image methods

class SocialCoverImagePickedSuccessState extends SocialStates {}

class SocialCoverImagePickedErrorState extends SocialStates {}

// select Chat image methods

class SocialChatImagePickedSuccessState extends SocialStates {}

class SocialChatImagePickedErrorState extends SocialStates {}

// upload cover image methods

class SocialUploadCoverImageSuccessState extends SocialStates {}

class SocialUploadCoverImageErrorState extends SocialStates {}

// update the user methods

class SocialUserUpdateErrorState extends SocialStates {}

class SocialUserUpdateLoadingState extends SocialStates {}

// create Post
class SocialCreatePostErrorState extends SocialStates {}

class SocialCreatePostLoadingState extends SocialStates {}

class SocialCreatePostSuccessState extends SocialStates {}

// Post image picker
class SocialPostImagePickedSuccessState extends SocialStates {}

class SocialPostImagePickedErrorState extends SocialStates {}

// remove the image
class SocialRemovePostImageState extends SocialStates {}

class SocialRemoveChatImageState extends SocialStates {}

// get posts methods

class SocialGetPostsSuccessState extends SocialStates {}

class SocialGetPostsLoadingState extends SocialStates {}

class SocialGetPostsErrorState extends SocialStates {
  final String error;

  SocialGetPostsErrorState(this.error);
}

// like methods

class SocialLikePostsSuccessState extends SocialStates {}

class SocialLikePostsErrorState extends SocialStates {
  final String error;

  SocialLikePostsErrorState(this.error);
}

// comment methods

class SocialCommentPostsSuccessState extends SocialStates {}

class SocialCommentPostsLoadingState extends SocialStates {}

class SocialCommentPostsErrorState extends SocialStates {
  final String error;

  SocialCommentPostsErrorState(this.error);
}

// for getting all users
class SocialGetAllUsersSuccessState extends SocialStates {}

class SocialGetAllUsersLoadingState extends SocialStates {}

class SocialGetAllUsersErrorState extends SocialStates {
  final String error;

  SocialGetAllUsersErrorState(this.error);
}

// chats

class SocialSendMessageSuccessState extends SocialStates {}

class SocialSendMessageErrorState extends SocialStates {}

class SocialGetMessageSuccessState extends SocialStates {}

// update the Chat Image methods

class SocialChatImageUploadErrorState extends SocialStates {}

class SocialChatImageUploadSuccessState extends SocialStates {}

class SocialChatImageUploadLoadingState extends SocialStates {}
