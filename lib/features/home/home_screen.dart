import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../core/constants/constant.dart';
import '../../core/utils/utils.dart';
import '../auth/sign_in/signin_cubit/signin_cubit.dart';
import '../auth/sign_in/signin_cubit/signin_state.dart';
import '../product_details/product_details.dart';
import 'cubit/home_cubit.dart';
import 'cubit/home_state.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  var x=0;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    int _current = 0;

  final CarouselController _controller = CarouselController();

  final List<Image> adsList = [
    Image.asset(AssetsImages.ads,fit: BoxFit.cover,width: 95.w,),
    Image.asset(AssetsImages.ads2,fit: BoxFit.cover,width: 95.w,)
  ];

  @override
  Widget build(BuildContext context) {

    var list = [];
    var categoryList=[];
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
    var cubit = HomeCubit.get(context);

    cubit.fetchProducts();
    cubit.fetchCategories();

    list = cubit.proList;
    categoryList= cubit.catList;
    var x;
    // void idd(m) {
    //   print(m);
    // //  cubit.fetchProducts();
    // }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Text(
          'Home',
          style: TextStyle(fontSize: 16.sp, color: Colors.black),
        ),
        centerTitle: true,
        leading :Icon(Icons.menu,color: Colors.black,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      padding:
                      const EdgeInsets.fromLTRB(12, 14, 26, 10),
                      width: 300,
                      height: 52,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(90),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.search),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration.collapsed(
                                hintText: 'Search...',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              CarouselSlider(items: adsList.map((item) => Container(
                child: Center(
                  child:item
                ),
              )).toList() ,
                  options: CarouselOptions(
                    //autoPlay: true,
                    viewportFraction:1,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: adsList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 3.w,
                      height:.5.h,
                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.blue).withOpacity(_current == entry.key ? 1 : 0.4)
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 2.h,),
              SizedBox(
                width: double.infinity,
                height: 15.h,
                child: ConditionalBuilder(
                    condition: categoryList.isNotEmpty,
                    builder: (context) => ListView.separated(
                      scrollDirection: Axis.horizontal,
                      // padding: EdgeInsets.only(left: 16,right: 6),
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          SizedBox(
                            width: 9.w,
                          ),
                      itemCount: categoryList.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          //   navigateTo(
                          //       context, JobDetail());
                        },
                        child: categoryItemWidget(categoryList[index], context),),
                      //list[index]
                    ),
                    fallback: (context) => const Center(
                        child: CircularProgressIndicator())),
              ),
              SizedBox(height: 4.h,),
              Row(
                children: [
                  Text(
                    'New Arrivals',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {

                    },
                    child: Text(
                      'Show All',
                      style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.black
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 35.h,
                child: ConditionalBuilder(
                    condition: list.isNotEmpty,
                    builder: (context) => ListView.separated(
                      scrollDirection: Axis.horizontal,
                      // padding: EdgeInsets.only(left: 16,right: 6),
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          SizedBox(
                            width: 2.w,
                          ),
                      itemCount: list.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                         // navigateTo(context,ProductDetails(id:x,) );
                         },
                        child: ItemsWidget(list[index], context,x),),
                      //list[index]
                    ),
                    fallback: (context) => const Center(
                        child: CircularProgressIndicator())),
              ),
              SizedBox(height: 2.h,),
              Row(
                children: [
                  Text(
                    'pobular',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold
                    ),),
                  const Spacer(),
                  TextButton(
                    onPressed: () {

                    },
                    child: Text(
                      'Show All',
                      style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.black
                      ),
                    ),)
                ],
              ),
              SizedBox(height: 4.h,),
              SizedBox(
                width: double.infinity,
                height: 35.h,
                child: ConditionalBuilder(
                    condition: list.isNotEmpty,
                    builder: (context) => ListView.separated(
                      scrollDirection: Axis.horizontal,
                      // padding: EdgeInsets.only(left: 16,right: 6),
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          SizedBox(
                            width: 2.w,
                          ),
                      itemCount: list.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {


                        },
                        child: ItemsWidget(list[index], context,x),),
                      //list[index]
                    ),
                    fallback: (context) => const Center(
                        child: CircularProgressIndicator())),
              ),

            ],
          ),
        ),
      ),
    );
    });

  }
    Widget ItemsWidget(list, BuildContext context,x) {

      return Container(
        width: 40.w,
        height: 30.h,

        padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
        margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white ,
            borderRadius: BorderRadius.circular(20)
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.topRight
              ,child: IconButton(
              onPressed: () {
                print(list.id);

              },
              icon: Icon(Icons.favorite_border,
                color: Colors.orange,
              ),
            ),

            ),
            InkWell(
              onTap: (){
                 x= list.id;
                 print(list.id);
                 Future.delayed(const Duration(seconds: 1), () {
                   navigateTo(context, ProductDetails(id: x));
                 });

              },
              child: Container(
                  width: 25.w,
                  height: 10.h,
                  child: Image.network('${list.imageLink}',
                    fit: BoxFit.fill,)
              ),
            ),
            SizedBox(height: 2.h,),
            Container(
              padding: EdgeInsets.only(bottom: 1.h),
              alignment: Alignment.centerLeft,
              child: Text('${list.name??'shibl'}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 11.sp),
              ),
            ),
            Text('${list.description??'shibl'}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,style:TextStyle(fontSize: 7.sp),),
            SizedBox(height: 1.h,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$  ${list.price??'65'}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:TextStyle(fontWeight: FontWeight.bold,fontSize: 10.sp,color: Colors.blue),),
                  InkWell(
                    onTap: (){

                    },
                    child: const Icon(Icons.shopping_cart_checkout),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
}


Widget categoryItemWidget(categoryList, BuildContext context) {
  return Column(
    children: [
      CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage('${categoryList.imageLink}'),
       // Image.network('${categoryList.imageLink}'),
      ),
      SizedBox(height: 2.h,),
      Text('${categoryList.name??'shibl'}',
            maxLines: 1,
               overflow: TextOverflow.ellipsis,
      )
    ],
  );
}






// class ItemsWidget extends StatelessWidget {
//   ItemsWidget(list,BuildContext context, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return GridView.count(
//       childAspectRatio: .68,
//       crossAxisCount: 2,
//       shrinkWrap: true,
//       children: [
//         Container(
//           padding: EdgeInsets.only(left: 15,right: 15,top: 10),
//           margin: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
//           decoration: BoxDecoration(
//             color: Colors.white ,
//             borderRadius: BorderRadius.circular(20)
//           ),
//           child:  Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               const Align(
//                 alignment: Alignment.topLeft
//                   ,child: Icon(Icons.favorite_border,color: Colors.orange,)
//               ),
//               InkWell(
//                 onTap: (){
//                   navigateTo(context,ProductDetails());
//                 },
//                 child: Container(
//                   margin: const EdgeInsets.all(8),
//                   child: Image.asset(AssetsImages.ads),
//                 ),
//               ),
//               SizedBox(height: 3.h,),
//               Container(
//                 padding: EdgeInsets.only(bottom: 1.h),
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   '${list.name}',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 11.sp),
//                 ),
//               ),
//               Text('Description',style:TextStyle(fontSize: 7.sp),),
//               SizedBox(height: 1.h,),
//               Padding(
//                   padding: EdgeInsets.symmetric(vertical: 2.h),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("\$ 25",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 10.sp,color: Colors.blue),),
//                     InkWell(
//                       onTap: (){
//
//                       },
//                       child: const Icon(Icons.shopping_cart_checkout),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
//
// }