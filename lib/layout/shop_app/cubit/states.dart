import 'package:login/model/shop_app/favorites_model.dart';
import 'package:login/model/shop_app/login_model.dart';

abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class ShopChangeBottomNavState extends ShopStates {}

class ShopLoadingHomeDataState extends ShopStates {}

class ShopSuccessHomeDataState extends ShopStates {}

class ShopErrorHomeDataState extends ShopStates {
  final String error;
  ShopErrorHomeDataState(this.error);
}

class ShopSuccessCategoryDataState extends ShopStates {}

class ShopErrorCategoryDataState extends ShopStates {
  final String error;
  ShopErrorCategoryDataState(this.error);
}

class ShopSuccessChangeFavoritesDataState extends ShopStates {
  final FavoritesModel model;
  ShopSuccessChangeFavoritesDataState(this.model);
}

class ShopSuccessFavoritesDataState extends ShopStates {}

class ShopLoadingGetFavoritesDataState extends ShopStates {}

class ShopErrorChangeFavoritesDataState extends ShopStates {
  final String error;
  ShopErrorChangeFavoritesDataState(this.error);
}

class ShopSuccessGetFavoritesState extends ShopStates {}

class ShopErrorGetFavoritesState extends ShopStates {
  final String error;
  ShopErrorGetFavoritesState(this.error);
}

class ShopSuccessUserDataState extends ShopStates {
  final ShopLoginModel loginModel;

  ShopSuccessUserDataState(this.loginModel);
}

class ShopLoadingUserDataState extends ShopStates {}

class ShopErrorUserDataState extends ShopStates {
  final String error;
  ShopErrorUserDataState(this.error);
}

class ShopSuccessUpdateUserDataState extends ShopStates {
  final ShopLoginModel loginModel;

  ShopSuccessUpdateUserDataState(this.loginModel);
}

class ShopLoadingUpdateUserDataState extends ShopStates {}

class ShopErrorUpdateUserDataState extends ShopStates {
  final String error;
  ShopErrorUpdateUserDataState(this.error);
}
