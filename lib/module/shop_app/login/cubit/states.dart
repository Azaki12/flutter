import 'package:login/model/shop_app/login_model.dart';

abstract class ShopLoginStates {}

class ShopLoginInitialState extends ShopLoginStates {}

class ShopLoginLoadingState extends ShopLoginStates {}

class ShopLoginSuccessState extends ShopLoginStates {
  final ShopLoginModel loginModel;
  ShopLoginSuccessState(this.loginModel);
}

class ShopLoginChangePasswordVisibilityState extends ShopLoginStates {}

class ShopLoginErrorState extends ShopLoginStates {
  final String error;

  ShopLoginErrorState(this.error);
}
