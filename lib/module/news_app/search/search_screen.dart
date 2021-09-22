import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/layout/news_app/cubit/cubit.dart';
import 'package:login/layout/news_app/cubit/states.dart';
import 'package:login/shared/component/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, states) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            title: Text('Search'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultTextForm(
                  controller: searchController,
                  type: TextInputType.text,
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Empty String :)';
                    }
                    return null;
                  },
                  label: 'Search',
                  prefix: Icons.search,
                ),
              ),
              Expanded(
                child: articleBuilder(list, isSearch: true),
              ),
            ],
          ),
        );
      },
    );
  }
}
