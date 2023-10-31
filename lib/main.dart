import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kortobaa/route/app_route.dart';
import 'package:kortobaa/shared/local_storage/shared_pref.dart';
import 'package:sizer/sizer.dart';
import 'features/auth/sign_in/login.dart';
import 'features/auth/sign_in/signin_cubit/signin_cubit.dart';
import 'features/auth/sign_up/Register.dart';
import 'features/favorite/favorite.dart';
import 'features/home/cubit/home_cubit.dart';
import 'features/home/home.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
 // Bloc.observer = MyBlocObserver();
  //DioHelper.init();
  await MyCache.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()..fetchProducts(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
      ],
      child: Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              // AppRoute.routes,
              //  initialRoute: ,
              //locale: DevicePreview.locale(context),
              //builder: DevicePreview.appBuilder,
              theme: ThemeData().copyWith(),
              debugShowCheckedModeBanner: false,
              home: Home(),
            );
          }
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double number = 0;
  double result = 0;

  static const MethodChannel platform = MethodChannel('flutter_square_calculator');

  Future<void> calculateSquare() async {
    try {
      final double calculatedResult = await platform.invokeMethod('calculateSquare', number);
      setState(() {
        result = calculatedResult;
      });
    } on PlatformException catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Square Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Enter a number:'),
            TextField(
              onChanged: (value) {
                setState(() {
                  number = double.tryParse(value) ?? 0;
                });
              },
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: calculateSquare,
              child: Text('Calculate Square'),
            ),
            Text('Result: $result'),
          ],
        ),
      ),
    );
  }
}