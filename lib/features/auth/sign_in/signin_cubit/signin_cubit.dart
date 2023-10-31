import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kortobaa/features/auth/sign_in/signin_cubit/signin_state.dart';
import '../../../../model/produt_model/product_model.dart';
import '../../../../services/remote/dio_helper.dart';
import '../../../../shared/local_storage/shared_pref.dart';


class LoginCubit extends Cubit<LoginStates> {


  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);


  String? token;
  final networkService = NetworkService();

  Future<void> login(userName, password, context) async {
    String url = "https://flutterapi.kortobaa.net/users/login/";
    emit(LoginLoadingState());
    try {
      Response response = await networkService.postData(url,
          { "username": userName, "password": password,});

      MyCache.saveData(key: 'token', value: response.data['access']);
      token = MyCache.getData(key: 'token');
      emit(LoginSuccessState());
      //navigateToAndStop(context, HomeScreen());
      // getAllJobs();
    } catch (e) {
      //  showToast(context);
      if (kDebugMode) {
        print('${e.toString()}');
      }
      emit(LoginFailureState(errMessage: 'sorry user not exist'));
    }
  }

  int? id;

  Future<void> register(username, password, email, firstname, lastname,
      context) async {
    String url = "https://flutterapi.kortobaa.net/users/register/";
    try {
      Response response = await networkService.postData(url, {
        'username': username,
        'password': password,
        'email': email,
        'first_name': firstname,
        'last_name': lastname,
      });
      MyCache.saveData(key: 'id', value: response.data['user']['id']);
      id = MyCache.getData(key: 'id');
      print(id);
      emit(SignUpSuccessState());
      //navigateTo(context, const WorkType());
    } catch (e) {
      //showToastWhenRegister(context);
      if (kDebugMode) {
        print(e.toString());
      }
      emit(SignUpFailureState(errMessage: 'registration is failed'));
    }
  }







}
  // Future<void> fetchProducts() async {
  //   const url = 'https://flutterapi.kortobaa.net/api/v1/products/';
  //   try {
  //     final response = await networkService.get(url);
  //     if (response.statusCode == 200) {
  //       final data = response.data;
  //       //print(data['results'][0]['name']);
  //       final product = Product.fromJson(data);
  //       List<Product> productList = data.map((item) => Product.fromJson(item)).toList();
  //
  //       proList = productList;
  //      } else {
  //       print('Failed to fetch data: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //     // Handle network errors here
  //   }
 // }

//   Future<Product?> fetchProducts() async {
//     const url = 'https://flutterapi.kortobaa.net/api/v1/products';
//     String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk4MzYzOTQ5LCJpYXQiOjE2OTgzMjc5NDksImp0aSI6IjgxNTJlY2EyZTNmYTQ4Y2FhMmM2Mjk4ZWVlNzRkNTAwIiwidXNlcl9pZCI6NDh9.Lwjpj_hMMzYVS0B7lbEtvELZoG-acOPNTwh2t5ttjUM';
//
//
//     try {
//       networkService.dio.options.headers['Authorization'] = 'Bearer $token';
//       final response = await networkService.get(url);
//       //if (response.statusCode == 200) {
//         final product = Product.fromJson(response.data);
//
//        List<Product> products = product.map((item) => Product.fromJson(item)).toList();
//
//         return product;
//       //}
//     } catch (e) {
//       print("Error fetching data: $e");
//     }
//     return null;
//   }
// }



  // Future<List<Product>> fetchProducts() async {
  //   final url = 'https://flutterapi.kortobaa.net/api/v1/products/';
  //     String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk4MzYzOTQ5LCJpYXQiOjE2OTgzMjc5NDksImp0aSI6IjgxNTJlY2EyZTNmYTQ4Y2FhMmM2Mjk4ZWVlNzRkNTAwIiwidXNlcl9pZCI6NDh9.Lwjpj_hMMzYVS0B7lbEtvELZoG-acOPNTwh2t5ttjUM';
  //
  //   try {
  //     networkService.dio.options.headers['Authorization'] = 'Bearer $token';
  //     final response = await networkService.get(url);
  //
  //     if (response.statusCode == 200) {
  //       final List<dynamic> productsData = response.data['products'];
  //
  //       final List<Product> products = productsData.map((item) => Product.fromJson(item)).toList();
  //       return products;
  //     } else {
  //       throw Exception('Failed to load products');
  //     }
  //
  //   } catch (e) {
  //     throw e;
  //   }
  // }
  //



// Future<List<Product>> fetchProducts() async {
  //   const url = 'https://flutterapi.kortobaa.net/api/v1/products/';
  //   String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk4MzYzOTQ5LCJpYXQiOjE2OTgzMjc5NDksImp0aSI6IjgxNTJlY2EyZTNmYTQ4Y2FhMmM2Mjk4ZWVlNzRkNTAwIiwidXNlcl9pZCI6NDh9.Lwjpj_hMMzYVS0B7lbEtvELZoG-acOPNTwh2t5ttjUM';
  //   try {
  //     networkService.dio.options.headers['Authorization'] = 'Bearer $token';
  //     final response = await networkService.get(url);
  //     print("shibl11111111111");
  //
  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> data = response.data;
  //       if (data.containsKey('products')) {
  //         final List<dynamic> productsData = data['products'];
  //
  //         final List<Product> products = productsData.map((item) => Product.fromJson(item)).toList();
  //        // return products;
  //       }
  //     }
  //   } catch (e) {
  //     throw e;
  //   }
  // }


