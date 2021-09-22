import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/shared/component/components.dart';
import 'package:login/shared/cubit/cubit.dart';
import 'package:login/shared/cubit/states.dart';

class NewTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).newTasks;
        return tasksBuilder(tasks: tasks);
      },
    );
  }
}
