import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/layout/shop_app/cubit/cubit.dart';
import 'package:login/layout/shop_app/cubit/states.dart';
import 'package:login/shared/component/components.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
          itemCount: ShopCubit.get(context).categoryModel.data.data.length,
          itemBuilder: (context, index) => buildCatItem(
              ShopCubit.get(context).categoryModel.data.data[index]),
          separatorBuilder: (context, index) => myDivider(),
        );
      },
    );
  }

  Widget buildCatItem(Map<String, dynamic> model) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Image(
              image: NetworkImage(
                '${model['image']}',
              ),
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              '${model['name']}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
            )
          ],
        ),
      );
}
