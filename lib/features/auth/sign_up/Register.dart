import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utils/utils.dart';
import '../../../custom_widget/custom_widget.dart';
import '../sign_in/signin_cubit/signin_cubit.dart';
import '../sign_in/signin_cubit/signin_state.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool obSecureText = true;

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LoginCubit.get(context);

          void _Register(username, password, email, firstname, lastname) {
            if (_formKey.currentState!.validate()) {
              cubit.register(username, password,email, firstname, lastname,  context);

              //cubit.getSavedJobs(id);
              _clearTF();
            }
          }

          return Scaffold(
            backgroundColor: const Color(0xFFF5F5F9),
            body: SafeArea(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Center(
                          child: Image(
                            image: AssetImage(AssetsImages.logo),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          'New Account',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                              fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Hi, fill out the information to register ',
                            style: TextStyle(fontSize: 11.sp),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'User Name',
                              style: TextStyle(fontSize: 11.sp),
                            )),
                        SizedBox(
                          height: 1.h,
                        ),
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
                        SizedBox(
                          height: 1.h,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'E-mail',
                              style: TextStyle(fontSize: 11.sp),
                            )),
                        SizedBox(
                          height: 1.h,
                        ),
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
                        SizedBox(
                          height: 1.h,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'First Name',
                              style: TextStyle(fontSize: 11.sp),
                            )),
                        SizedBox(
                          height: 1.h,
                        ),
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
                        SizedBox(
                          height: 1.h,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'First Name',
                              style: TextStyle(fontSize: 11.sp),
                            )),
                        SizedBox(
                          height: 1.h,
                        ),
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
                        SizedBox(
                          height: 1.h,
                        ),
                        //pass
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Password',
                              style: TextStyle(fontSize: 11.sp),
                            )),
                        SizedBox(
                          height: 1.h,
                        ),
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
                        SizedBox(
                          height: 2.h,
                        ),
                        Mainbuttom(
                            text: 'Register',
                            onTap: () {
                              _Register(
                                  _userNameController.text,
                                  _passwordController.text,
                                  _emailController.text,
                                  _firstNameController.text,
                                  _lastNameController.text);
                            }),
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
                                style: TextStyle(
                                    fontSize: 14.sp, color: Colors.orange),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
  _clearTF(){
    _userNameController.clear();
    _passwordController.clear();
    _emailController.clear();
    _firstNameController.clear();
    _lastNameController.clear();
  }
}


