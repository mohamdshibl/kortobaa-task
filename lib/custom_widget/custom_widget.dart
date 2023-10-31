import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatelessWidget {
  late String hintText;
  late bool obsecuretext;
  IconButton? suffixIcon;
  FormFieldValidator? validator;
  ValueChanged<String>? onChanged;
  TextEditingController? controller = TextEditingController();

  CustomTextFormField(
      {required this.hintText,
        this.obsecuretext = false,
        this.suffixIcon,
        this.validator,
        this.onChanged,
        this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      obscureText: obsecuretext,
      decoration: InputDecoration(
          fillColor: Colors.white,
          focusColor: Colors.white,
          hoverColor: Colors.white,
          suffixIcon: suffixIcon,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blue)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
              borderRadius: BorderRadius.circular(10)),
          prefixIconColor: Colors.black,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFF9CA3AF),
          )),
      style: const TextStyle(fontSize: 14, color: Colors.blue),
    );
  }
}

Widget Mainbuttom({
  required String text,
  required VoidCallback onTap,
}) =>
    SizedBox(
      height: 5.5.h,
      width: 90.w,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFf0000CE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            )),
        child: Center(
          child: defaultText(
            text: text,
            fontSize: 13.0.sp,
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defaultText({
  required String text,
  var fontSize,
  required color,
}) =>
    Text(
      text,
      style: TextStyle(fontSize: fontSize, color: color),
    );
