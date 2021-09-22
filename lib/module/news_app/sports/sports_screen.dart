import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/layout/news_app/cubit/cubit.dart';
import 'package:login/layout/news_app/cubit/states.dart';
import 'package:login/shared/component/components.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;

        return articleBuilder(list);
      },
      listener: (context, state) {},
    );
  }
}
