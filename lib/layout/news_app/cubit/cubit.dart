import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/layout/news_app/cubit/states.dart';
import 'package:login/module/news_app/business/busieness_screen.dart';
import 'package:login/module/news_app/science/science_screen.dart';
import 'package:login/module/news_app/sports/sports_screen.dart';
import 'package:login/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      label: 'Business',
      icon: Icon(Icons.business),
    ),
    BottomNavigationBarItem(
      label: 'Sports',
      icon: Icon(Icons.sports),
    ),
    BottomNavigationBarItem(
      label: 'Science',
      icon: Icon(Icons.science),
    ),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  int selectedIndex = 0;
  bool isDesktop = false;

  void setDesktop(bool value) {
    isDesktop = value;
    emit(NewsSetDesktopState());
  }

  void selectBusinessItem(index) {
    // for (int i = 0; i < businessSelectedItem.length; i++) {
    //   if (i == index) {
    //     businessSelectedItem[i] = true;
    //   } else {
    //     businessSelectedItem[i] = false;
    //   }
    // }
    selectedIndex = index;
    emit(NewsSelectBusinessItemState());
  }

  List<dynamic> business = [];
  // List<bool> businessSelectedItem = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> search = [];

  void getBusinessData() {
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      business = value.data['articles'];
      // business.forEach((element) {
      //   businessSelectedItem.add(false);
      // });
      print(business[0]['title']);
      //print(value.data['status']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((onError) {
      print('error is ${onError.toString()}');
      emit(NewsGetBusinessErrorState(onError.toString()));
    });
  }

  void getSportsData() {
    emit(NewsGetSportsLoadingState());

    if (sports.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        sports = value.data['articles'];
        //print(sports[0]['title']);
        //print(value.data['status']);
        emit(NewsGetSportsSuccessState());
      }).catchError((onError) {
        //print('error is ${onError.toString()}');
        emit(NewsGetSportsErrorState(onError.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  void getScienceData() {
    emit(NewsGetScienceLoadingState());

    if (science.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        science = value.data['articles'];
        //print(science[0]['title']);
        //print(value.data['status']);
        emit(NewsGetScienceSuccessState());
      }).catchError((onError) {
        //print('error is ${onError.toString()}');
        emit(NewsGetScienceErrorState(onError.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    search = [];

    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      search = value.data['articles'];
      //print(science[0]['title']);
      //print(value.data['status']);
      emit(NewsGetSearchSuccessState());
    }).catchError((onError) {
      print('error is ${onError.toString()}');
      emit(NewsGetSearchErrorState(onError.toString()));
    });
  }

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) {
      getSportsData();
    }
    if (index == 2) {
      getScienceData();
    }
    emit(NewsButtomNavState());
  }
}
