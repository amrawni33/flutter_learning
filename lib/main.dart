import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/modules/counter/counterscreen.dart';
import 'package:startup_namer/modules/login/login_screen.dart';
import 'package:startup_namer/shared/bloc_observer.dart';

import 'layout/home_layout.dart';

void main() {
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Counter(),
    );
  }
}
