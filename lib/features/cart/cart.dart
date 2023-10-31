import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/constants/constant.dart';
import '../../core/utils/utils.dart';
import '../../custom_widget/custom_widget.dart';
import '../auth/sign_up/Register.dart';

class Cart extends StatelessWidget {
   Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:  const Icon(Icons.menu,color: Colors.black,),
        title:   const Text('Cart',style:TextStyle(color: Colors.black),) ,
        centerTitle: true,
        actions:  const [Icon(Icons.search,color: Colors.black,),],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 7.h,
                decoration: const BoxDecoration(
                  color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total",style:TextStyle(color: Colors.blueAccent,fontSize: 16.sp),),
                          SizedBox(width: 2.w,),
                          Text("\$ 89",style:TextStyle(color: Colors.black,fontSize: 16.sp),),

                        ],
                      ) ,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Item",style:TextStyle(color: Colors.black,fontSize: 16.sp),),
                          SizedBox(width: 2.w,),
                          Text("(555)",style:TextStyle(color: Colors.blue,fontSize: 16.sp),),

                        ],
                      ) ,
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h,),
              ItemsWidget(),
              SizedBox(height: 3.h,),
              Container(
                width: double.infinity,
                height: 12.h,
                decoration: const BoxDecoration(
                    color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total",style:TextStyle(color: Colors.blueAccent,fontSize: 16.sp),),
                          Text("\$ 89",style:TextStyle(color: Colors.black,fontSize: 16.sp),),
                        ],
                      ) ,
                      SizedBox(height: 2.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tax",style:TextStyle(color: Colors.blueAccent,fontSize: 16.sp),),
                          Text("\$ 7.60",style:TextStyle(color: Colors.black,fontSize: 16.sp),),
                        ],
                      ) ,
                    ],
                  ),
                ),
              ),
              SizedBox(height: 3.h),
              Mainbuttom(text: 'Complete your purchase', onTap: () {}),
            ],
          ),
        ),
      )
    );
  }
}


class ItemsWidget extends StatelessWidget {
  const ItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 36.w,
              height: 15.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(AssetsImages.ads2),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 2.w,),
            Expanded(
              child: SizedBox(
                width:36.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('juice is a drink made from the extraction or pressing of '
                              'the natural liquid contained in fruit and vegetables',
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 11.sp,fontWeight: FontWeight.w400),
                          ),
                    SizedBox(height: 6.h,),
                    Text('\$ 500',
                      style: TextStyle(fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
        defaultSeparatorContainer(),
        Row(
          children: [
            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 12.w,
                      height: 4.h,
                      color: Colors.blue,
                      child: Center(child: TextButton(onPressed: (){},
                        child: Center(child: Icon(Icons.exposure_minus_1,color: Colors.white,)),)),
                    ),
                    Container(
                      width: 12.w,
                      height: 4.h,
                      color: Colors.white,
                      child: Center(child: Text('5')),
                    ),
                    Container(
                      width: 12.w,
                      height: 4.h,
                      color: Colors.blue,
                      child: Center(child: TextButton(onPressed: (){},
                        child: Center(child: Icon(Icons.plus_one,color: Colors.white,)),)),
                    ),
                  ],
                ),

            Expanded(
                child: Row(
                  children: [
                    Container(
                        width: 45.w,
                        height: 4.h,
                        color: Colors.white,
                        child: Center(child: Text('\$ 69.68 ',style:TextStyle(color: Colors.black,))),
                    ),
                    Container(
                       width: 10.w,
                        height: 4.h,
                        color: Colors.orange,
                        child: Icon(Icons.delete_forever_sharp,color: Colors.white,)
                    ),
                  ],
                )
            ),
          ],
        ),
      ],
    );
  }

}