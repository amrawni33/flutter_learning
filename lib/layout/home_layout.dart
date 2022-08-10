import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:startup_namer/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:startup_namer/modules/done_tasks/done_tasks_screen.dart';
import 'package:startup_namer/shared/components/components.dart';

import '../modules/new_tasks/new_tasks_screen.dart';
import '../shared/components/constants.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
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
  Database? database;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  bool isBottomSheetShown = false;
  IconData? fabIcon = Icons.edit;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  @override
  void initState() {
    super.initState();
    createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(title[currentIndex]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          fabIcon,
        ),
        onPressed: () {
          if (isBottomSheetShown) {
            if ((formKey.currentState)!.validate()) {
              insertToDatabase(
                      title: titleController.text,
                      time: timeController.text,
                      date: dateController.text)
                  .then((value) {
                getDataFromDatabase(database).then((value) {
                  Navigator.pop(context);
                  setState(() {
                    isBottomSheetShown = false;
                    fabIcon = Icons.edit;
                    tasks = value;
                    print(tasks);
                  });
                });
              });
            }
          } else {
            (scaffoldKey.currentState)!
                .showBottomSheet(
                  (context) => Container(
                    color: Colors.grey[200],
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          defaultFormField(
                            controller: titleController,
                            type: TextInputType.text,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Title must not be empty ';
                              }
                              return null;
                            },
                            labelText: 'Task title',
                            prefix: Icons.title,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          defaultFormField(
                            controller: timeController,
                            type: TextInputType.datetime,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Time must not be empty ';
                              }
                              return null;
                            },
                            labelText: 'Task time',
                            prefix: Icons.watch_later,
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                timeController.text =
                                    value!.format(context).toString();
                              });
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          defaultFormField(
                            controller: dateController,
                            type: TextInputType.datetime,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Date must not be empty ';
                              }
                              return null;
                            },
                            labelText: 'Task date',
                            prefix: Icons.calendar_month,
                            onTap: () {
                              showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2022-10-10'))
                                  .then((value) {
                                dateController.text =
                                    DateFormat.yMMMd().format(value!);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .closed
                .then((value) {
              isBottomSheetShown = false;
              setState(() {
                fabIcon = Icons.edit;
              });
            });
            isBottomSheetShown = true;
            setState(() {
              fabIcon = Icons.add;
            });
          }
        },
      ),
      body: tasks.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outline), label: 'Done'),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive_outlined), label: 'archive'),
        ],
      ),
    );
  }

  void createDatabase() async {
    database = await openDatabase('todo.db', version: 1,
        onCreate: (database, version) async {
      await database.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT , status TEXT)');
      print('database created');
    }, onOpen: (database) {
      getDataFromDatabase(database).then((value) {
        setState(() {
          tasks = value;
          print(tasks);
        });
      });
      print('database opened');
    });
  }

  Future insertToDatabase({
    @required String? title,
    @required String? time,
    @required String? date,
  }) async {
    return await database!.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO Test(title, date,time, status) VALUES ("$title","$date","$time","new")')
          .then((value) {
        print('$value inserted successfully');
      }).catchError((error) {
        print('Error when inserting new record ${error.toString()}');
      });
      return null;
    });
  }

  Future<List<Map>> getDataFromDatabase(database) async {
    return await database!.rawQuery('SELECT * FROM Test');
  }
}
