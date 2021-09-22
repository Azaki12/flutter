import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/model/shop_app/login_model.dart';
import 'package:login/module/shop_app/login/cubit/states.dart';
import 'package:login/shared/network/end_point.dart';
import 'package:login/shared/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  ShopLoginModel loginModel;

  void userLogin({
    @required String email,
    @required String password,
    String lang,
  }) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(
      lang: lang,
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      loginModel = ShopLoginModel.fromJson(value.data);
      emit(ShopLoginSuccessState(loginModel));
    }).catchError((onError) {
      print(onError.toString());
      emit(ShopLoginErrorState(onError.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPasswordShown = true;

  void changePasswordVisibility() {
    isPasswordShown = !isPasswordShown;

    suffix = isPasswordShown
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;

    emit(ShopLoginChangePasswordVisibilityState());
  }
}
