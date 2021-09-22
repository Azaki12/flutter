import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/layout/news_app/news_layout.dart';
import 'package:login/layout/shop_app/cubit/cubit.dart';
import 'package:login/layout/social_app/social_layout/cubit/cubit.dart';
import 'package:login/module/social_app/social_login/login_screen.dart';
import 'package:login/shared/component/components.dart';
import 'package:login/shared/component/constants.dart';
import 'package:login/shared/cubit/cubit.dart';
import 'package:login/shared/network/local/cashe_helper.dart';
import 'package:login/shared/styles/themes.dart';

import 'layout/news_app/cubit/cubit.dart';
import 'layout/social_app/social_layout/social_layout.dart';
import 'shared/bloc_observer.dart';
import 'shared/cubit/states.dart';
import 'shared/network/remote/dio_helper.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('background msg');
  print(message.data.toString());
  showToast(message: 'background msg', state: ToastStates.SUCCESS);
}

void main() async {
  // ensures that all the items in the main method is finished then runs the app
  WidgetsFlutterBinding.ensureInitialized();

  // setting the minimum width and height on app
  if (Platform.isMacOS)
    await DesktopWindow.setMinWindowSize(
      Size(
        650,
        650,
      ),
    );

  if (Platform.isWindows)
    await DesktopWindow.setMinWindowSize(
      Size(
        1024,
        800,
      ),
    );

  // await Firebase.initializeApp();
  // // to receive notification while app is running
  // var notificationToken = await FirebaseMessaging.instance.getToken();
  // print(notificationToken);
  //
  // FirebaseMessaging.onMessage.listen((event) {
  //   print('notification');
  //   print(event.data.toString());
  //
  //   showToast(message: 'onMessage', state: ToastStates.SUCCESS);
  // });
  //
  // FirebaseMessaging.onMessageOpenedApp.listen((event) {
  //   print('notification');
  //   print(event.data.toString());
  //   showToast(message: 'onMessageOpenedApp', state: ToastStates.SUCCESS);
  // });
  //
  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  Widget widget;

  bool isDark = CacheHelper.getData(key: 'isDark');
  // bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  // token = CacheHelper.getData(key: 'token');
  uId = CacheHelper.getData(key: 'uId');

  // Shop App
  // if (onBoarding != null) {
  //   if (token != null) {
  //     widget = ShopLayout();
  //   } else {
  //     widget = ShopLoginScreen();
  //   }
  // } else {
  //   widget = OnBoardingScreen();
  // }

  if (uId != null) {
    widget = SocialLayout();
  } else {
    widget = SocialLoginScreen();
  }

  runApp(
    MyApp(
      isDark: isDark,
      startWidget: widget,
      token: token,
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final Widget startWidget;
  final String token;

  MyApp({this.isDark, this.startWidget, this.token});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()..getBusinessData(),
        ),
        BlocProvider(
          create: (context) => AppCubit()
            ..changeThemeMode(
              darkMode: isDark,
            ),
        ),
        BlocProvider(
          create: (context) => ShopCubit()
            ..getHomeData()
            ..getCategoryData()
            ..getFavoritesData()
            ..getUserData(),
        ),
        BlocProvider(
          create: (context) => SocialCubit()
            ..getUserData()
            ..getPosts(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            darkTheme: darkTheme,
            home: NewsLayout(),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
