import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startup_namer/layout/news_app/cubit/states.dart';
import 'package:startup_namer/modules/business/business_screen.dart';
import 'package:startup_namer/modules/science/science_screen.dart';
import 'package:startup_namer/modules/sports/sports_screen.dart';

import '../../../modules/settings_screen/settings_screen.dart';
import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0 ;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'business'
    ),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: 'sports'
    ),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: 'science'
    ),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
        ),
        label: 'settings'
    ),
  ];

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    const SettingsScreen(),
  ];
  void changeBottomNavBar(int index){
    currentIndex =index;
    emit(NewsBottomNavState());
  }

  List<dynamic> business=[];
  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apikey':'65f7f556ec76449fa7dc7c0069f040ca'
        }
    ).then((value){
      // print(value.data['articles'][1]['title']);
      business =value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }
}
