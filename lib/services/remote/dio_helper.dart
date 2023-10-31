import 'package:dio/dio.dart';

import '../../shared/local_storage/shared_pref.dart';


class NetworkService {
  final Dio dio = Dio();

     String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk4MzYzOTQ5LCJpYXQiOjE2OTgzMjc5NDksImp0aSI6IjgxNTJlY2EyZTNmYTQ4Y2FhMmM2Mjk4ZWVlNzRkNTAwIiwidXNlcl9pZCI6NDh9.Lwjpj_hMMzYVS0B7lbEtvELZoG-acOPNTwh2t5ttjUM';

  //String? token = MyCache.getData(key: 'token');
  // Map<String, dynamic> headers = {
  //   'Content-Type': 'application/json',
  //   'Accept': 'application/json',
  // };

  Future<Response> get(String url) async {
    try {
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.get(url);
      return response;
    } catch (e) {
      throw e;
    }
  }


  Future<Response> postData(String url, dynamic data) async {
    try {
      // dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.post(url, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }



  Future<Response> put(String url, dynamic data) async {
    try {
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.put(url, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(String url) async {
    try {
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.delete(url);
      return response;
    } catch (e) {
      throw e;
    }
  }


}



