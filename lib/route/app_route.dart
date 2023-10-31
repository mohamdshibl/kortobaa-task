import 'package:kortobaa/features/auth/sign_in/login.dart';
import 'package:kortobaa/features/auth/sign_up/Register.dart';

class AppRoute {
  static const String dashboard = "/";

  Map routes={
    'LoginPage' : (context) => Login(),
    'RegisterPage' : (context) => Register(),
  };
}