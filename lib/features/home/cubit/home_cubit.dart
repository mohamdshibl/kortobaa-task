import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_screen.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {

  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
List<Widget> screans = [
   HomeScreen(),
  HomeScreen(),
  HomeScreen(),
  HomeScreen(),

];
List<BottomNavigationBarItem> b = [
  const BottomNavigationBarItem(
      label: 'الرئيسيه',
      icon: Icon(Icons.person),
      activeIcon: Icon(Icons.kayaking_outlined),
  ),
  BottomNavigationBarItem(
      label: 'الاقسام',
      icon: Icon(Icons.person),
      activeIcon: Icon(Icons.lock)
  ),
  BottomNavigationBarItem(
      label: 'المفضله',
      icon: Icon(Icons.person),
      activeIcon: Icon(Icons.person),
  ),
  const BottomNavigationBarItem(
      label: 'الحساب',
      icon: Icon(Icons.person)
  ),
];

  void changeIndexBtmNav(int index) {
    currentIndex = index;

    emit(HomeSuccessState());
  }

}