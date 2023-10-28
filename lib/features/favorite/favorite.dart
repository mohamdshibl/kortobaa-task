import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../core/utils/utils.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.menu,color: Colors.black,),
        title:  const Text('Favorites',style:TextStyle(color: Colors.black),) ,
        centerTitle: true,
        actions: const [
          Icon(Icons.search,color: Colors.black,),
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ItemsWidget(),
                  SizedBox(height: 1.h,),
                  ItemsWidget(),
                ],
              ),
            ),
          ),
      ),
    );
  }
}


class ItemsWidget extends StatelessWidget {
  const ItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 95.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ) ,
      child: Column(
        children: [
          Column(
              children: [
                Container(
                  height: 40.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetsImages.ads2),
                      fit: BoxFit.cover, // Specify the fit of the image
                    ),
                  ),
                ),
              ],
            ),
          SizedBox(height: 2.h),
          Align(
            alignment: Alignment.topLeft,
            child: Text('5555555lwkdwdmmklaekcflkd 5555555lwkdwdmmklaekcflkdv 5555555lwkdwdmmklaekcflkd',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style:  TextStyle(
                fontSize: 16.sp,
              ),
            ),
          ),
          SizedBox(height: 1.h),
           Align(
             alignment: Alignment.topLeft,
               child: Text('\$ 199',
                 style: TextStyle(color: const Color(0xFf0000CE),
                   fontSize: 12.sp),)),
          SizedBox(height: 1.h),
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Container(
              width: 95.w,
            height: 5.h,
            color: const Color(0xFf0000CE),
            child: Center(child: Text('Move To cart',
              style: TextStyle(fontSize: 22.sp,
                  color: Colors.white),)),
          ),
        ),
        ],
      ),
    );
  }

}