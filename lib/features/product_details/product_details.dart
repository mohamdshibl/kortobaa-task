import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kortobaa/core/constants/constant.dart';
import 'package:kortobaa/model/produt_model/product_model.dart';
import 'package:sizer/sizer.dart';

import '../../core/utils/utils.dart';
import '../cart/cart_cubit/cart_cubit.dart';
import '../cart/cart_cubit/cart_state.dart';

class ProductDetails extends StatelessWidget {
   ProductDetails({Key? key}) : super(key: key);
Product? product;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
    builder: (context, state) {
    var cubit = CartCubit.get(context);

    return Scaffold(
      backgroundColor:  const Color(0xFFF5F5F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading:TextButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back,color: Colors.blueGrey,),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 3,
              child: Container(
                   width: double.infinity,
                   height: 40.h,
                  color: Colors.white,
                child: const Image(image:  AssetImage(AssetsImages.ads),
              ),
               ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: 7.h,
              color: Colors.white,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Share',style: TextStyle(fontSize: 16.sp),),
                        SizedBox(width: 1.w,),
                        Icon(Icons.share),
                      ],
                    )
                  ),
                  defaultSeparatorContainer2(),
                  Text('Added to Favorite',style: TextStyle(fontSize: 12.sp),),
                ],
              )
              ),
            ),
          SizedBox(height: 2.h,),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text('asJKjkbjaebcajj a JKjkbjaebcajj aJKjkbjaebcajj a'),
                      SizedBox(height: 2.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star,color: Colors.yellow,),
                              Text('4.5',style: TextStyle(fontSize: 12.sp),)
                            ],
                          ),
                          Row(
                            children: [
                              Text(' \$  199.5',style: TextStyle(fontSize:12.sp,color: Colors.blueAccent),),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h,),
                      defaultSeparatorContainer(),
                      SizedBox(height: 2.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         Text('Discription',style: TextStyle(fontSize: 12.sp),),
                          Icon(Icons.arrow_drop_down_outlined,size: 16.sp,),
                        ],
                      ),
                      SizedBox(height: 2.h,),
                      defaultSeparatorContainer(),
                      SizedBox(height: 2.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 45.w,
                            height: 6.h,
                            color: Colors.white,
                            child: Center(child: Text('\$ ${cubit.counter*199}')),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 12.w,
                                height: 6.h,
                                color: Colors.blue,
                                child: Center(child: TextButton(onPressed: (){
                                  cubit.decrement();
                                },
                                  child: const Icon(Icons.exposure_minus_1,color: Colors.white,),)),
                              ),
                              Container(
                                width: 18.w,
                                height: 6.h,
                                color: Colors.white,
                                child: Center(child: Text('${cubit.counter}')),
                              ),
                              Container(
                                width: 12.w,
                                height: 6.h,
                                color: Colors.blue,
                                child: Center(child: TextButton(onPressed: (){
                                  cubit.increment();
                                },
                                  child: const Icon(Icons.plus_one,color: Colors.white,),)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 3.h,),
                      InkWell(
                        onTap: () {
                          product?.q =cubit.counter;
                          cubit.products.add(product!);
                         print('shib');
                          showToastWhenRegister(context);
                        },
                        child: Container(
                          width: 45.w,
                          height: 6.h,
                          color: Colors.blue,
                          child:  const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Add to Cart',style: TextStyle(color: Colors.white),),
                                Icon(Icons.add_shopping_cart,color: Colors.white,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        ],
      ) ,
    );
    });
  }
}
void showToastWhenRegister( context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content:  Text('email or password is not valid',style: TextStyle(fontSize: 12.sp),),
      action: SnackBarAction(
          label: 'ok', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}