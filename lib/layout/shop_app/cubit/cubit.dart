import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/layout/shop_app/cubit/states.dart';
import 'package:login/model/shop_app/category_model.dart';
import 'package:login/model/shop_app/favorites_model.dart';
import 'package:login/model/shop_app/get_favorites.dart';
import 'package:login/model/shop_app/home_model.dart';
import 'package:login/model/shop_app/login_model.dart';
import 'package:login/module/shop_app/cateogires_screen/cat_screen.dart';
import 'package:login/module/shop_app/favorites_screen/favorites_screen.dart';
import 'package:login/module/shop_app/product_screen/product_screen.dart';
import 'package:login/module/shop_app/settings_screen/setting_screen.dart';
import 'package:login/shared/component/components.dart';
import 'package:login/shared/component/constants.dart';
import 'package:login/shared/network/end_point.dart';
import 'package:login/shared/network/remote/dio_helper.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsShopScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel homeModel;

  CategoriesModel categoryModel;

  Map<int, bool> favorites = {};

  FavoritesModel favoritesModel;

  void getHomeData() {
    emit(ShopLoadingHomeDataState());

    DioHelper.getData(
      url: HOME,
      token: token,
      lang: 'en',
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      //print(homeModel.data.products);

      homeModel.data.products.forEach((element) {
        favorites.addAll({
          element['id']: element['in_favorites'],
        });
      });

      print(favorites.toString());

      emit(ShopSuccessHomeDataState());
    }).catchError((onError) {
      print(onError.toString());
      emit(ShopErrorHomeDataState(onError.toString()));
    });
  }

  void getCategoryData() {
    DioHelper.getData(
      url: GET_CATEGORIES,
      token: token,
      lang: 'en',
    ).then((value) {
      categoryModel = CategoriesModel.fromJson(value.data);
      //print(categoryModel.data.data);
      emit(ShopSuccessCategoryDataState());
    }).catchError((onError) {
      print(onError.toString());
      emit(ShopErrorCategoryDataState(onError.toString()));
    });
  }

  GetFavorites getFavorites;

  void getFavoritesData() {
    emit(ShopLoadingGetFavoritesDataState());

    DioHelper.getData(
      url: FAVORITES,
      token: token,
      lang: 'en',
    ).then((value) {
      getFavorites = GetFavorites.fromJson(value.data);
      //print(value.data.toString());

      emit(ShopSuccessGetFavoritesState());
    }).catchError((onError) {
      print(onError.toString());
      emit(ShopErrorGetFavoritesState(onError.toString()));
    });
  }

  void changeFavorites(int productID) {
    favorites[productID] = !favorites[productID];

    emit(ShopSuccessFavoritesDataState());

    DioHelper.postData(
      url: FAVORITES,
      token: token,
      lang: 'en',
      data: {
        'product_id': productID,
      },
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);

      print(value.data['status']);

      if (!favoritesModel.status) {
        favorites[productID] = !favorites[productID];
        // showToast(
        //   state: ToastStates.ERROR,
        //   message: 'Couldn\'t add/remove from favorites.',
        // );
      }
      getFavoritesData();

      emit(ShopSuccessChangeFavoritesDataState(favoritesModel));
    }).catchError((onError) {
      favorites[productID] = !favorites[productID];
      showToast(
        state: ToastStates.ERROR,
        message: 'Couldn\'t add/remove from favorites.',
      );

      emit(ShopErrorChangeFavoritesDataState(onError.toString()));
    });
  }

  ShopLoginModel user;

  void getUserData() {
    emit(ShopLoadingUserDataState());

    DioHelper.getData(
      url: PROFILE,
      token: token,
      lang: 'en',
    ).then((value) {
      user = ShopLoginModel.fromJson(value.data);
      print(user.data.name);

      emit(ShopSuccessUserDataState(user));
    }).catchError((onError) {
      print(onError.toString());
      emit(ShopErrorUserDataState(onError.toString()));
    });
  }

  void updateUserData({
    @required String name,
    @required String email,
    @required String phone,
  }) {
    emit(ShopLoadingUpdateUserDataState());

    DioHelper.putData(
      data: {
        'email': email,
        'name': name,
        'phone': phone,
      },
      url: UPDATE,
      token: token,
      lang: 'en',
    ).then((value) {
      user = ShopLoginModel.fromJson(value.data);

      emit(ShopSuccessUpdateUserDataState(user));
    }).catchError((onError) {
      print(onError.toString());
      emit(ShopErrorUpdateUserDataState(onError.toString()));
    });
  }
}
