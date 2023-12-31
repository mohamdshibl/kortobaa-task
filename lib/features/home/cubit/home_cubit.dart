import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import '../../../model/produt_model/product_model.dart';
import '../../../services/remote/dio_helper.dart';
import '../../../shared/local_storage/database_helper.dart';
import '../../auth/profile/profile.dart';
import '../../cart/cart.dart';
import '../../category/category.dart';
import '../../favorite/favorite.dart';
import '../home_screen.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {

  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  final networkService = NetworkService();
  List<Product> proList = [];
  List<Category> catList = [];
  int currentIndex = 0;



List<Widget> screens = [
   HomeScreen(),
   Categoryy(),
   Favorites(),
  AccountScreen(),

];
List<BottomNavigationBarItem> bottoms = const[
  BottomNavigationBarItem(
    label: 'Home',
    icon: Icon(Icons.home),
  ),
  BottomNavigationBarItem(
    label: 'Category',
    icon: Icon(Icons.category),
  ),
  BottomNavigationBarItem(
    label: 'Favorite',
    icon: Icon(Icons.favorite),
  ),
  BottomNavigationBarItem(
      label: 'Account',
      icon: Icon(Icons.person)
  ),
];

void changeIndexBtmNav(int index) {
    currentIndex = index;

    emit(ChangeBtmNavState());
  }



  Future<void> fetchProducts() async {
    List<int?> favoriteList = [];

    const url = 'https://flutterapi.kortobaa.net/api/v1/products/';
    try {
      final response = await networkService.get(url);
      emit( FetchProductSuccessState());
      if (response.statusCode == 200) {
        final data = response.data;
        var productList = (data['results'] as List<dynamic>).map((item) =>
            Product.fromJson(item)).toList();
        proList = productList;

       //  print('fetchProducts');
       //  productList.forEach((element) {favoriteList.addAll({element.id});});
       // print(favoriteList);


      } else {
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchCategories() async {
    const url = 'https://flutterapi.kortobaa.net/api/v1/categories/';
    try {
      final response = await networkService.get(url);
      emit( FetchProductLoadingState());
      if (response.statusCode == 200) {
        final data = response.data;
        print(data['results'][0]['name']);

        var categoryList = (data['results'] as List<dynamic>).map((item) =>
            Category.fromJson(item)).toList();
        emit( FetchProductLoadingState());
        catList = categoryList;

        print('shivl==');
        print(catList[0].name);

      } else {
        print('Failed to fetch categories: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }







}