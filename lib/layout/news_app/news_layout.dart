import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/layout/news_app/cubit/cubit.dart';
import 'package:login/module/news_app/search/search_screen.dart';
import 'package:login/shared/component/components.dart';
import 'package:login/shared/cubit/cubit.dart';

import 'cubit/states.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                ),
                onPressed: () {
                  navigateTo(context, SearchScreen());
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.brightness_4_outlined,
                ),
                onPressed: () {
                  AppCubit.get(context).changeThemeMode();
                },
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: ('Business'),
              ),
              BottomNavigationBarItem(
                label: 'Sports',
                icon: Icon(Icons.sports),
              ),
            ],
            // items: cubit.bottomItems,
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     print('data : ');
          //   },
          //   child: Icon(
          //     Icons.add,
          //   ),
          // ),
        );
      },
      listener: (context, state) {},
    );
  }
}
