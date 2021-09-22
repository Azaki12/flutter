import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/model/social_app/social_user_model.dart';
import 'package:login/module/social_app/social_register/cubit/states.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    @required String email,
    @required String password,
    @required String name,
    @required String phone,
    String lang,
  }) {
    emit(SocialRegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      userCreate(
        email: email,
        name: name,
        phone: phone,
        uID: value.user.uid,
      );
    }).catchError((onError) {
      emit(SocialRegisterErrorState(onError.toString()));
    });
  }

  void userCreate({
    @required String email,
    @required String name,
    @required String phone,
    @required String uID,
    String image,
  }) {
    SocialUserModel model = SocialUserModel(
      name: name,
      email: email,
      phone: phone,
      uID: uID,
      bio: 'write your bio....',
      image:
          'https://avatars.githubusercontent.com/u/82341310?s=400&u=eccfa949f5d943b6950a01a3021cc465e7eaebc8&v=4',
      coverImage:
          'https://avatars.githubusercontent.com/u/82341310?s=400&u=eccfa949f5d943b6950a01a3021cc465e7eaebc8&v=4',
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uID)
        .set(model.toMap())
        .then((value) {
      emit(SocialCreateUserSuccessState());
    }).catchError((onError) {
      emit(SocialCreateUserErrorState(onError.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPasswordShown = true;

  void changePasswordVisibility() {
    isPasswordShown = !isPasswordShown;

    suffix = isPasswordShown
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;

    emit(SocialRegisterChangePasswordVisibilityState());
  }
}
