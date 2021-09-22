import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/layout/shop_app/cubit/cubit.dart';
import 'package:login/layout/shop_app/cubit/states.dart';
import 'package:login/model/shop_app/category_model.dart';
import 'package:login/model/shop_app/home_model.dart';
import 'package:login/shared/component/components.dart';
import 'package:login/shared/styles/colors.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      builder: (context, state) {
        return ConditionalBuilder(
          condition: ShopCubit.get(context).homeModel != null &&
              ShopCubit.get(context).categoryModel != null,
          builder: (context) => productsBuilder(
            ShopCubit.get(context).homeModel,
            ShopCubit.get(context).categoryModel,
            context,
          ),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      listener: (context, state) {
        if (state is ShopSuccessChangeFavoritesDataState) {
          if (!state.model.status) {
            print('error');
            showToast(
              message: state.model.message,
              state: ToastStates.ERROR,
            );
          }
        }
      },
    );
  }

  Widget productsBuilder(HomeModel model, CategoriesModel catModel, context) =>
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: model.data.banners
                  .map(
                    (e) => Image(
                      image: NetworkImage(
                        '${e['image']}',
                      ),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 250.0,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(
                  seconds: 3,
                ),
                autoPlayAnimationDuration: Duration(
                  seconds: 1,
                ),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                viewportFraction: 1.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 100,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          buildCategoryItem(catModel.data.data[index]),
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10,
                      ),
                      itemCount: catModel.data.data.length,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'New Products',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 0.0,
                // width / height => aspectRatio
                childAspectRatio: 1 / 1.66,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: List.generate(
                  model.data.products.length,
                  (index) =>
                      buildGridProduct(model.data.products[index], context),
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildGridProduct(Map<String, dynamic> model, context) => Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(model['image']),
                  width: double.infinity,
                  height: 170.0,
                  //fit: BoxFit.cover,
                ),
                if (model['discount'] != 0)
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text(
                      'DISCOUNT',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model['name'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.0,
                      height: 1.3,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${model['price']}',
                        style: TextStyle(
                          color: defaultColor,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      if (model['discount'] != 0)
                        Text(
                          '${model['old_price']}',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      Spacer(),
                      IconButton(
                        icon: CircleAvatar(
                          backgroundColor:
                              ShopCubit.get(context).favorites[model['id']]
                                  ? defaultColor
                                  : Colors.grey,
                          radius: 14.0,
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          ShopCubit.get(context).changeFavorites(model['id']);
                          print(model['id']);
                        },
                        iconSize: 14.0,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget buildCategoryItem(Map<String, dynamic> model) => Container(
        width: 100,
        height: 100,
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
              image: NetworkImage(
                '${model['image']}',
              ),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              color: Colors.black.withOpacity(.8),
              child: Text(
                '${model['name']}',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
}
