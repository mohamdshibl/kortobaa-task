import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/utils/utils.dart';

class Category extends StatelessWidget {
   Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading:  const Icon(Icons.menu,color: Colors.black,),
          title:   const Text('Category',style:TextStyle(color: Colors.black),) ,
          centerTitle: true,
          actions:  const [Icon(Icons.search,color: Colors.black,),],
        ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ItemsWidget(),
          ],
        ),
      ),

    );
  }
}


class ItemsWidget extends StatelessWidget {
  const ItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Stack(
        children: [
              SizedBox(
                  height: 16.h,
                  width: double.infinity,
                  child: const Card(
                    margin: EdgeInsets.all(.5),
                    elevation: 10,
                    child: Image(
                      image: AssetImage(AssetsImages.ads),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
               Align(
              alignment: Alignment.center,
              child: Text('T-Shirt',
                  style: TextStyle(color: Colors.white,
                      fontSize: 20.sp),
              ),
                ),
            ],
          );
  }

}