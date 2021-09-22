import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:login/shared/component/components.dart';
import 'package:login/shared/cubit/cubit.dart';
import 'package:login/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // .. means to create an obj and then access fields inside it
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);

          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentIndex],
              ),
            ),
            body: ConditionalBuilder(
              builder: (context) {
                return cubit.screens[cubit.currentIndex];
              },
              condition: state is! AppGetDatabaseLoadingState,
              fallback: (context) {
                return Center(child: CircularProgressIndicator());
              },
            ),
            bottomNavigationBar: BottomNavigationBar(
              //type: BottomNavigationBarType.fixed,
              //backgroundColor: Colors.red,
              elevation: 50.0,
              //showSelectedLabels: false,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                // setState(() {});
                cubit.changeIndex(index);
                print(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle_outline),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined),
                  label: 'Archived',
                ),
              ],
            ),
            floatingActionButton: SingleChildScrollView(
              child: FloatingActionButton(
                onPressed: () async {
                  // telling the annoyo method that theres something that will work in the background threads by using async
                  // to make the getName() method wait we use the await keyword to tell it to wait for the result to come

                  // try {
                  //   var name = await getName();
                  //   print(name);
                  //   //throw ('error :)');
                  // } catch (e) {
                  //   print(e.toString());
                  // }

                  // getName().then(
                  //   (value) {
                  //     print(value);
                  //   },
                  // ).catchError((error) {
                  //   print('error ${error.toString()}');
                  // });
                  //insertToDatabase();
                  if (cubit.isBottomSheetShown) {
                    if (formKey.currentState.validate()) {
                      // insertToDatabase(
                      //   time: timeController.text,
                      //   title: titleController.text,
                      //   date: dateController.text,
                      // ).then((value) {
                      //   getDataFromDatabase(database).then((value) {
                      //     titleController.text = '';
                      //     dateController.text = '';
                      //     timeController.text = '';
                      //     Navigator.pop(context);
                      //
                      //     // setState(() {
                      //     //   tasks = value;
                      //     //   isBottomSheetShown = false;
                      //     //   fabIcon = Icons.edit;
                      //     // });
                      //   });
                      // }).catchError((onError) {});

                      cubit
                          .insertToDatabase(
                        title: titleController.text,
                        time: timeController.text,
                        date: dateController.text,
                      )
                          .then((value) {
                        timeController.text = '';
                        dateController.text = '';
                        titleController.text = '';
                      });
                    }
                  } else {
                    scaffoldKey.currentState
                        .showBottomSheet(
                          (context) => Container(
                            color: Colors.grey[100],
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    defaultTextForm(
                                      controller: titleController,
                                      type: TextInputType.text,
                                      validate: (String value) {
                                        if (value.isEmpty) {
                                          return 'title must not be Empty';
                                        }
                                        return null;
                                      },
                                      label: 'Task Title',
                                      prefix: Icons.title,
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    defaultTextForm(
                                      controller: timeController,
                                      type: TextInputType.datetime,
                                      validate: (String value) {
                                        if (value.isEmpty) {
                                          return 'time must not be Empty';
                                        }
                                        return null;
                                      },
                                      onTap: () {
                                        showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        ).then((value) {
                                          timeController.text =
                                              value.format(context).toString();
                                          print(value.format(context));
                                        }).catchError((onError) {});
                                        print('tapped');
                                      },
                                      label: 'Task time',
                                      prefix: Icons.watch_later_outlined,
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    defaultTextForm(
                                      controller: dateController,
                                      type: TextInputType.datetime,
                                      validate: (String value) {
                                        if (value.isEmpty) {
                                          return 'time must not be Empty';
                                        }
                                        return null;
                                      },
                                      onTap: () {
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          lastDate:
                                              DateTime.parse('2021-08-20'),
                                          firstDate: DateTime.now(),
                                        ).then((value) {
                                          dateController.text =
                                              DateFormat.yMMMd().format(value);
                                          print(
                                              DateFormat.yMMMd().format(value));
                                        }).catchError((onError) {});
                                      },
                                      label: 'Task date',
                                      prefix: Icons.calendar_today,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          elevation: 25.0,
                        )
                        .closed
                        .then((value) {
                      cubit.changeBottomSheetState(
                        isShow: false,
                        icon: Icons.edit,
                      );
                    });
                    cubit.changeBottomSheetState(
                      isShow: true,
                      icon: Icons.add,
                    );
                  }
                },
                child: Icon(
                  cubit.fabIcon,
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, AppStates state) {
          if (state is AppInsertDatabaseState) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }

// for data that will be coming in the future we use the Future<datatype>
// and using the async keyword after the name of the method to tell the compiler to open a thread for the method
// and not to run in the main thread
// Future<String> getName() async {
//   return 'Ahmed Zaki';
// }

}
