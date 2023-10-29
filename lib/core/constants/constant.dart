import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void navigateTo(context, widget) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => widget)
  );
}

void navigateToAndStop(context, widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget,),
        (Route<dynamic> route) => false,
  );
}

Widget defaultSeparatorContainer() {
  return Container(
    width: 90.w,
    height: .25.h,
    color: Colors.grey[300],
  );
}
Widget defaultSeparatorContainer2() {
  return Container(
    height: 7.h,
    width: .3.w,
    color: Colors.grey,
  );
}
