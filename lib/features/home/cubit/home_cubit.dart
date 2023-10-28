import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kortobaa/features/cart/cart.dart';

import '../../category/category.dart';
import '../../favorite/favorite.dart';
import '../home_screen.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {

  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
List<Widget> screens = [
   HomeScreen(),
  Category(),
  Favorites(),
  HomeScreen(),

];
List<BottomNavigationBarItem> bottoms = const[
  BottomNavigationBarItem(
    label: 'Home',
    icon: Icon(Icons.home),
  ),
  BottomNavigationBarItem(
    label: 'Category',
    icon: Icon(Icons.category),
  ),
  BottomNavigationBarItem(
    label: 'Favorite',
    icon: Icon(Icons.favorite),
  ),
  BottomNavigationBarItem(
      label: 'Account',
      icon: Icon(Icons.person)
  ),
];

  void changeIndexBtmNav(int index) {
    currentIndex = index;

    emit(ChangeBtmNavState());
  }

}