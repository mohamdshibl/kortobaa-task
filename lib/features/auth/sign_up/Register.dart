import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utils/utils.dart';

class Register extends StatelessWidget {
   Register({Key? key}) : super(key: key);

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool   obSecureText = true;

  @override
  Widget build(BuildContext context) {

    void _Register(username,password ,email,firstname,lastname ) {
      if (_formKey.currentState!.validate()) {

      } else {
        // showDialog(
        //   context: context,
        //   builder: (context) => AlertDialog(
        //     title: Text('Error'),
        //     content: Text('Invalid username or password'),
        //     actions: [
        //       TextButton(
        //         onPressed: () {
        //           Navigator.pop(context);
        //         },
        //         child: Text('OK'),
        //       ),
        //     ],
        //   ),
        // );
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F9),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child:SingleChildScrollView(
              child: Column(
                children: [
                  const Center(
                    child: Image(image: AssetImage(AssetsImages.logo),
                    ),
                  ),
                  SizedBox(height: 4.h,),
                  Text('New Account',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.orange,fontSize: 14.sp),
                  ),
                  SizedBox(height: 3.h,),
                  Align(
                    alignment: Alignment.center,
                    child: Text('Hi, fill out the information to register ',
                      style: TextStyle(fontSize: 11.sp),
                    ),
                  ),
                  SizedBox(height: 4.h,),
                  Align(
                    alignment: Alignment.topLeft,
                      child: Text('User Name',style: TextStyle(fontSize: 11.sp),)
                  ),
                  SizedBox(height: 1.h,),
                  CustomTextFormField(
                    controller: _userNameController,
                    validator: (var value) {
                      if (value.isEmpty) {
                        return 'Please enter your User Name';
                      }
                      return null;
                    },
                    hintText: 'Username',
                  ),
                  SizedBox(height: 1.h,),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text('E-mail',style: TextStyle(fontSize: 11.sp),)),
                  SizedBox(height: 1.h,),
                  CustomTextFormField(
                    controller: _emailController,
                    validator: (var value) {
                      if (value.isEmpty) {
                        return 'Please enter your Email';
                      }
                      return null;
                    },
                    hintText: 'email',
                  ),
                  SizedBox(height: 1.h,),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text('First Name',style: TextStyle(fontSize: 11.sp),)),
                  SizedBox(height: 1.h,),
                  CustomTextFormField(
                    controller: _firstNameController,
                    validator: (var value) {
                      if (value.isEmpty) {
                        return 'Please enter your First Name';
                      }
                      return null;
                    },
                    hintText: 'First name',
                  ),
                  SizedBox(height: 1.h,),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text('First Name',style: TextStyle(fontSize: 11.sp),)),
                  SizedBox(height: 1.h,),
                  CustomTextFormField(
                    controller: _lastNameController,
                    validator: (var value) {
                      if (value.isEmpty) {
                        return 'Please enter your Last Name';
                      }
                      return null;
                    },
                    hintText: 'Last name',
                  ),
                  SizedBox(height: 1.h,),
                  //pass
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text('Password',style: TextStyle(fontSize: 11.sp),)
                  ),
                  SizedBox(height: 1.h,),
                  CustomTextFormField(
                    controller: _passwordController,
                    validator: (var value) {
                      if (value.isEmpty) {
                        return 'password is to short';
                      }
                      return null;
                    },
                    obsecuretext: obSecureText,
                    suffixIcon: IconButton(
                      icon: obSecureText
                          ? Icon(Icons.visibility_off_outlined)
                          : Icon(Icons.visibility),
                      onPressed: () {
                        obSecureText = !obSecureText;
                      },
                    ),

                    hintText: 'Password',
                  ),
                  SizedBox(height: 2.h,),
                  Mainbuttom(text: 'Register',
                      onTap: () {
                        _Register(_userNameController.text,
                            _passwordController.text,_emailController.text,
                        _firstNameController.text,_lastNameController.text);
                  }
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 14.sp,color: Colors.orange),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ) ,
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  late String hintText;
  late bool obsecuretext;
  IconButton? suffixIcon;
  FormFieldValidator? validator;
  ValueChanged<String>? onChanged;
  TextEditingController? controller = TextEditingController();

  CustomTextFormField(
      {
        required this.hintText,
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
              borderSide: const BorderSide(color: Colors.blue)
          ),
              enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
              borderRadius: BorderRadius.circular(10)),
          prefixIconColor: Colors.black,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFF9CA3AF),
          )),
      style: const TextStyle(fontSize: 14,color: Colors.blue),
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