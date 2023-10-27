import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/home_cubit.dart';
import 'cubit/home_state.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {},
      builder:(context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          body: cubit.screans[cubit.currentIndex],

          ///  Navigation Bar
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            selectedItemColor: const Color(0xFF3366FF),
            unselectedItemColor: const Color(0xFF9CA3AF),
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeIndexBtmNav(index);
            },
            items: cubit.b,
          ),
        );
      },
    );
  }
}


