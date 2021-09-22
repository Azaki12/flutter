import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/layout/news_app/cubit/cubit.dart';
import 'package:login/layout/news_app/cubit/states.dart';
import 'package:login/shared/component/components.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (context, state) {
        var list = NewsCubit.get(context).business;

        return ScreenTypeLayout(
          mobile: Builder(
            builder: (context) {
              NewsCubit.get(context).setDesktop(false);
              return articleBuilder(list);
            },
          ),
          desktop: Builder(
            builder: (context) {
              NewsCubit.get(context).setDesktop(true);

              return Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 500,
                      child: articleBuilder(list),
                    ),
                  ),
                  if (list.length > 0)
                    Expanded(
                      child: Text(
                          '${list[NewsCubit.get(context).selectedIndex]['description']}'),
                    ),
                ],
              );
            },
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
