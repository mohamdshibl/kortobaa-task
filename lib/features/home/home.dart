import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kortobaa/core/constants/constant.dart';

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

          cubit.fetchProducts();
        return Scaffold(
          backgroundColor: const Color(0x0ff5f5f9),
          body: cubit.screens[cubit.currentIndex],

          bottomNavigationBar:
          BottomAppBar(
            shape: const CircularNotchedRectangle(),
            color: Colors.red,
            notchMargin: 2,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: BottomNavigationBar(
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
         //  BottomNavigationBar(
         //    backgroundColor: Colors.white,
         //    showUnselectedLabels: true,
         //    selectedItemColor: const Color(0xFF0000CE),
         //    unselectedItemColor: const Color(0xFF9CA3AF),
         //    currentIndex: cubit.currentIndex,
         //    onTap: (index) {
         //      cubit.changeIndexBtmNav(index);
         //    },
         //    items: cubit.bottoms,
         // ),
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

// class CustomBottomNavigationBar extends StatelessWidget {
//   final int currentIndex;
//   final ValueChanged<int> onTap;
//
//   CustomBottomNavigationBar({
//     required this.currentIndex,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipPath(
//       clipper: BottomNavigationBarClipper(),
//       child: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: currentIndex,
//         onTap: onTap,
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
//           BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
//           BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
//         ],
//       ),
//     );
//   }
// }
//
// class BottomNavigationBarClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     double clipSize = size.width / 6;
//     path.moveTo(0, 0);
//     path.lineTo((size.width - clipSize) / 2, 0);
//     path.lineTo(size.width / 2, clipSize);
//     path.lineTo((size.width + clipSize) / 2, 0);
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
