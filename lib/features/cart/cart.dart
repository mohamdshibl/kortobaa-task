import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/utils/utils.dart';

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
          ],
        ),
      )
    );
  }
}


class ItemsWidget extends StatelessWidget {
  const ItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
              //mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                      Text('uice iططبملممقسممقسملم iططبملممقسممقسملم'
                          'ممسقمقسممسمسقمس',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 11.sp,fontWeight: FontWeight.w400),
                      ),
                 SizedBox(height: 6.h,),
                Text('\$ 500',
                  style: TextStyle(fontSize: 11.sp,fontWeight: FontWeight.w400,color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

}