import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kortobaa/core/constants/constant.dart';
import 'package:kortobaa/features/auth/sign_in/signin_cubit/signin_cubit.dart';
import 'package:kortobaa/features/auth/sign_in/signin_cubit/signin_state.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/utils.dart';
import '../../../custom_widget/custom_widget.dart';
import '../sign_up/Register.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);


  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _ischecked = false;
   bool   obSecureText = true;

  @override
  Widget build(BuildContext context) {

    void _login(String email,password,) {
      if (_formKey.currentState!.validate()) {
      } else {
        // ElevatedButton(
        //   onPressed: () {
        //     showDialog(
        //       context: context,
        //       builder: (context) => AlertDialog(
        //         title: Text('Error'),
        //         content: Text('Invalid username or password'),
        //         actions: [
        //           TextButton(
        //             onPressed: () {
        //               Navigator.pop(context);
        //             },
        //             child: Text('OK'),
        //           ),
        //         ],
        //       ),
        //     );
        //   },
        //   child: Text('Show Dialog'),
        // );

      }
    }

    return BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {  },
        builder: (context, state) {

          var cubit = LoginCubit.get(context);

          void login(String username,password,) {
            if (_formKey.currentState!.validate()) {
              cubit.login(username,password,context);

              //cubit.getSavedJobs(id);
            }
          }

          return Scaffold(
            backgroundColor: Color(0xFFF5F5F9),
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
                        Text('Sign In',
                          style: TextStyle(fontWeight: FontWeight.bold,
                              color: Colors.orange,fontSize: 14.sp),
                        ),
                        SizedBox(height: 3.h,),
                        Align(
                          alignment: Alignment.center,
                          child: Text('Please log in to complete your purchase',
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
                        Mainbuttom(text: 'Login',
                            onTap: () {
                              login(_userNameController.text,_passwordController.text);
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
                                navigateTo(context, Register());
                              },
                              child: Text(
                                'Register',
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
        });
  }
}