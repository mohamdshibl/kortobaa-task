import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kortobaa/core/constants/constant.dart';
import 'package:sqflite/sqflite.dart';

import '../cart/cart.dart';
import 'cubit/home_cubit.dart';
import 'cubit/home_state.dart';

class Home extends StatelessWidget {
   Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {},
      builder:(context, state) {
        var cubit = HomeCubit.get(context);

        return Scaffold(
          backgroundColor: const Color(0x0ff5f5f9),
          body: cubit.screens[cubit.currentIndex],

          bottomNavigationBar:
          BottomAppBar(
            shape: const CircularNotchedRectangle(),
            color: Colors.white,
            notchMargin: 2,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
           backgroundColor: Colors.white,
           enableFeedback: false,
           showUnselectedLabels: true,
           selectedFontSize: 12,
           selectedItemColor: const Color(0xFF0000CE),
           unselectedItemColor: const Color(0xFF9CA3AF),
           currentIndex: cubit.currentIndex,
           onTap: (index) {
             cubit.changeIndexBtmNav(index);
           },
           items: cubit.bottoms,
        ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
             navigateTo(context, Cart());
            },
            elevation: 10,
            backgroundColor: Colors.orange,
            clipBehavior: Clip.hardEdge,
            child: const Icon(Icons.shopping_cart),
          ),
        );
      },
    );
  }
}

