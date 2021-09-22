import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/model/shop_app/login_model.dart';
import 'package:login/module/shop_app/shop_register_screen/cubit/states.dart';
import 'package:login/shared/network/end_point.dart';
import 'package:login/shared/network/remote/dio_helper.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates> {
  ShopRegisterCubit() : super(ShopRegisterInitialState());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);

  ShopLoginModel loginModel;

  void userRegister({
    @required String email,
    @required String password,
    @required String name,
    @required String phone,
    String lang,
  }) {
    emit(ShopRegisterLoadingState());
    DioHelper.postData(
      lang: lang,
      url: REGISTER,
      data: {
        'email': email,
        'name': name,
        'phone': phone,
        'password': password,
      },
    ).then((value) {
      loginModel = ShopLoginModel.fromJson(value.data);
      emit(ShopRegisterSuccessState(loginModel));
    }).catchError((onError) {
      print(onError.toString());
      emit(ShopRegisterErrorState(onError.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPasswordShown = true;

  void changePasswordVisibility() {
    isPasswordShown = !isPasswordShown;

    suffix = isPasswordShown
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;

    emit(ShopRegisterChangePasswordVisibilityState());
  }
}
