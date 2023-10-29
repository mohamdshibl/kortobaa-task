import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'features/auth/sign_in/login.dart';
import 'features/auth/sign_up/Register.dart';
import 'features/favorite/favorite.dart';
import 'features/home/cubit/home_cubit.dart';
import 'features/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..currentIndex,

      child: Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              // initialRoute: ,
              //locale: DevicePreview.locale(context),
              //builder: DevicePreview.appBuilder,
              theme: ThemeData().copyWith(),
              debugShowCheckedModeBanner: false,
              home: Login(),
            );
          }
      ),
    );
  }
}