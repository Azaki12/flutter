import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/layout/shop_app/cubit/cubit.dart';
import 'package:login/layout/shop_app/cubit/states.dart';
import 'package:login/shared/component/components.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      builder: (context, state) {
        return ConditionalBuilder(
          builder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildListProduct(
                ShopCubit.get(context).getFavorites.data.data[index].product,
                context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: ShopCubit.get(context).getFavorites.data.data.length,
          ),
          condition: state is! ShopLoadingGetFavoritesDataState,
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
      listener: (context, state) {},
    );
  }
}
