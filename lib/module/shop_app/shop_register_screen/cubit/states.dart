import 'package:login/model/shop_app/login_model.dart';

abstract class ShopRegisterStates {}

class ShopRegisterInitialState extends ShopRegisterStates {}

class ShopRegisterLoadingState extends ShopRegisterStates {}

class ShopRegisterSuccessState extends ShopRegisterStates {
  final ShopLoginModel loginModel;
  ShopRegisterSuccessState(this.loginModel);
}

class ShopRegisterChangePasswordVisibilityState extends ShopRegisterStates {}

class ShopRegisterErrorState extends ShopRegisterStates {
  final String error;

  ShopRegisterErrorState(this.error);
}
