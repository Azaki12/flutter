import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/layout/shop_app/cubit/cubit.dart';
import 'package:login/layout/shop_app/cubit/states.dart';
import 'package:login/module/shop_app/search_screen/search_screen.dart';
import 'package:login/shared/component/components.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Salla',
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  navigateTo(
                    context,
                    SearchScreen(),
                  );
                },
              ),
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeBottom(index);
            },
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.apps),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'settings',
              ),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
