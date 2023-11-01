import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../home/cubit/home_cubit.dart';
import '../home/cubit/home_state.dart';

class Categoryy extends StatelessWidget {
   Categoryy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var categoryList=[];

    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
    builder: (context, state) {
    var cubit = HomeCubit.get(context);

    categoryList= cubit.catList;
    cubit.fetchCategories();

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading:  const Icon(Icons.menu,color: Colors.black,),
          title:   const Text('Category',style:TextStyle(color: Colors.black),) ,
          centerTitle: true,
          actions:  const [Icon(Icons.search,color: Colors.black,),],
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [

              SizedBox(
                width: double.infinity,
                height: 100.h,
                child: ConditionalBuilder(
                    condition: categoryList.isNotEmpty,
                    builder: (context) => ListView.separated(
                      scrollDirection: Axis.vertical,
                      // padding: EdgeInsets.only(left: 16,right: 6),
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          SizedBox(
                            height: 3.h,
                          ),
                      itemCount: categoryList.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          //   navigateTo(
                          //       context, JobDetail(jobsindex: index));
                        },
                        child: ItemsWidget(categoryList[index], context),),
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
}


Widget ItemsWidget (categoryList,BuildContext context) {

  return Stack(
        children: [
              Container(
                width: double.infinity,
                  height: 16.h,
                  child:  Card(
                    margin: EdgeInsets.all(.5),
                    elevation: 10,
                    child: Image(
                      image:   NetworkImage('${categoryList.imageLink}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
               Align(
              alignment: Alignment.center,
              child: Text('${categoryList.name??'shibl'}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white,
                      fontSize: 20.sp),
              ),
                ),
            ],
          );

}