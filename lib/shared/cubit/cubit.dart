import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:startup_namer/shared/cubit/states.dart';

import '../../modules/archived_tasks/archived_tasks_screen.dart';
import '../../modules/done_tasks/done_tasks_screen.dart';
import '../../modules/new_tasks/new_tasks_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];
  Database? database;
  bool isBottomSheetShown = false;
  IconData? fabIcon = Icons.edit;
  int currentIndex = 0;
  List<Widget> screens = [
    NewTasks(),
    DoneTasks(),
    ArchivedTasks(),
  ];
  List<String> title = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  void createDatabase() {
    openDatabase('todo.db', version: 1, onCreate: (database, version) {
      database.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT , status TEXT)');
    }, onOpen: (database) {
      getDataFromDatabase(database);
    }).then((value) {
      database = value;
      emit(AppCreateDB());
    });
  }

  insertToDatabase({
    @required String? title,
    @required String? time,
    @required String? date,
  }) async {
    await database!.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO Test(title, date,time, status) VALUES ("$title","$date","$time","new")')
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDB());
        getDataFromDatabase(database);
      }).catchError((error) {
        print('Error when inserting new record ${error.toString()}');
      });
      return null;
    });
  }

  void getDataFromDatabase(database) async {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];
    emit(AppGetLoadingDB());
    database!.rawQuery('SELECT * FROM Test').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new') {
          newTasks.add(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else if (element['status'] == 'archive') {
          archivedTasks.add(element);
        }
      });
      emit(AppGetDB());
    });
  }

  void updateData({required String status, required int id}) async {
    return await database!.rawUpdate('UPDATE Test SET status = ? WHERE id = ?',
        [status, '$id']).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDB());
    });
  }

  void deleteData({required int id}) async {
    return await database!
        .rawUpdate('DELETE FROM Test WHERE id = ?', ['$id']).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDB());
    });
  }

  void changeBottomSheetState({
    required bool isShow,
    required IconData icon,
  }) {
    isBottomSheetShown = isShow;
    fabIcon = icon;
    emit(ChangeBottomSheetState());
  }

  bool isDark = true;

  void changeAppMode(){
    isDark =! isDark;
    emit(AppChangeModeState());
  }
}
