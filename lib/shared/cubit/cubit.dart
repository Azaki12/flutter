import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/module/todo_app/archieved_tasks/archieved_tasks_screen.dart';
import 'package:login/module/todo_app/done_tasks/done_tasks.dart';
import 'package:login/module/todo_app/new_tasks/new_tasks_screen.dart';
import 'package:login/shared/cubit/states.dart';
import 'package:login/shared/network/local/cashe_helper.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  bool isDark = false;

  static AppCubit get(context) => BlocProvider.of(context);

  Database database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  int currentIndex = 0;

  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('database is created');
        database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
            .then(
              (value) => print('table created'),
            )
            .catchError((error) {
          print('error creating table');
        });
        print('onCreate ended');
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        print('DB opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  Future insertToDatabase({
    @required String title,
    @required String time,
    @required String date,
  }) async {
    return await database.transaction((txn) {
      txn
          .rawInsert(
        'INSERT INTO tasks (title, date, time, status) VALUES ("$title", "$date", "$time", "new")',
      )
          .then((value) {
        print('$value insertion completed');
        emit(AppInsertDatabaseState());

        getDataFromDatabase(database);
      }).catchError((onError) {
        print('error in insertion');
      });

      return null;
    });
  }

  void getDataFromDatabase(database) {
    newTasks = [];
    archivedTasks = [];
    doneTasks = [];

    emit(AppGetDatabaseLoadingState());
    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new') {
          newTasks.add(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else {
          archivedTasks.add(element);
        }
      });
      emit(AppGetDatabaseState());
    });
  }

  void changeBottomSheetState({
    @required bool isShow,
    @required IconData icon,
  }) {
    isBottomSheetShown = isShow;
    fabIcon = icon;
    emit(AppBottomSheetState());
  }

  updateDatabase({
    @required String status,
    @required int id,
  }) async {
    // second string for inserting values where ? exists
    await database.rawUpdate(
      'UPDATE tasks SET status = ? where id = ?',
      ['$status', id],
    ).then(
      (value) {
        getDataFromDatabase(database);
        emit(AppUpdateDatabaseState());
      },
    );
  }

  deleteDatabase({
    @required int id,
  }) async {
    // second string for inserting values where ? exists
    await database.rawDelete(
      'DELETE FROM tasks where id = ?',
      [id],
    ).then(
      (value) {
        getDataFromDatabase(database);
        emit(AppDeleteDatabaseState());
      },
    );
  }

  void changeThemeMode({bool darkMode}) {
    if (darkMode != null) {
      isDark = darkMode;
      emit(AppChangeThemeModeState());
    } else {
      isDark = !isDark;

      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeThemeModeState());
      }).catchError((onError) {});
    }
  }

// DB manuiplation

// 1. create DB
// 1.5 create tables
// 2. open DB
// 3. insert to DB
// 4. get from DB
// 5. update in DB
// 6. delete from DB

}
