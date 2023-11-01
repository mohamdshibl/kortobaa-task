import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kortobaa/core/constants/constant.dart';
import 'package:kortobaa/model/produt_model/product_model.dart';
import 'package:sizer/sizer.dart';

import '../../core/utils/utils.dart';
import '../cart/cart.dart';
import '../cart/cart_cubit/cart_cubit.dart';
import '../cart/cart_cubit/cart_state.dart';

class ProductDetails extends StatelessWidget {

  var id ;
  ProductDetails( {Key? key,required this.id}) : super(key: key);
 List<dynamic> idList=[];
Product? product;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
    builder: (context, state) {
    var cubit = CartCubit.get(context);
     cubit.fetchProductById(id);
     idList=cubit.iDList;
   //  var price = (idList[0]['price']);
    var productID = idList[0]['id'] ;
    var productDescription = idList[0]['description'] ;
    var productImage = idList[0]['image_link'];
    var productPrice = idList[0]['price'];

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
                //Image.network('${'https://khodaryonline.com//storage/category/3/N2Ahhm734tcoictpFcGeiQlmkwo62V5BGzKsgmfo.jpg'}',
                   width: double.infinity,
                   height: 40.h,
                  color: Colors.white,
                child: Image.network('${idList[0]['image_link']}',
                  fit: BoxFit.fill,
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
                    onTap: (){

                    },
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
                  InkWell(onTap: (){
                    cubit.insertDataBase(id: productID, description: productDescription,
                        imageLink: productImage, price: productPrice);
                  },
                      child: Text('Added to Favorite',style: TextStyle(fontSize: 12.sp),)),
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
                      Text('${idList[0]['description']}'),
                      SizedBox(height: 2.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star,color: Colors.yellow,),
                              Text('${idList[0]['rate']}',style: TextStyle(fontSize: 12.sp),)
                            ],
                          ),
                          Row(
                            children: [
                              Text(' \$  ${idList[0]['price']}',style: TextStyle(fontSize:12.sp,color: Colors.blueAccent),),
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
                          //(idList[0]['price'])
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



                          //cubit.insertDataBase();
                          navigateToAndStop(context, Cart(productId:productID,));

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