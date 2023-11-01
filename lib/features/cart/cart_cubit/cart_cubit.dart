import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../../model/produt_model/product_id_model.dart';
import '../../../model/produt_model/product_model.dart';
import '../../../services/remote/dio_helper.dart';
import '../../../shared/local_storage/database_helper.dart';
import '../cart.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(): super(InitState());
  static CartCubit get(context) => BlocProvider.of(context);

  int counter = 1 ;
  final networkService = NetworkService();


  // List<Product> products= [];
  // addProduct(Product product){
  //   products.add(product);
  //   print('shibllllll');
  // }


  increment(){
    counter++;
    emit(PlusCounterState());
  }
  decrement(){
    if (counter>1) {
      counter--;
    }
    emit(MinusCounterState());
  }
  List iDList = [];

  Future<void> fetchProductById(id) async {
    String url = 'https://flutterapi.kortobaa.net/api/v1/products/$id/';
    try {
      emit(FetchProductIdLoadingState());
      final response = await networkService.get(url);
      if (response.statusCode == 200) {
        final data = response.data;
    emit(FetchProductIdSuccessState());
        print(data[0]['name']);
       iDList =data;
       print(iDList[0]);
      } else {
        throw Exception('Failed to fetch product: ${response.statusCode}');
      }
    } catch (e) {
      // Handle the exception
      emit(FetchProductIdFailureState());
      print('Error: ${e.toString()}');
    }
  }

   late Database database;
  insertDataBase({required int id,required String description,
    required String imageLink, required String price}) async {
    //emit(LoadingInsertDataBaseState());
    await database.transaction((txn) {
      return txn
          .rawInsert(
          'INSERT INTO Product(id,description,imageLink,type) VALUES("$id","$description", "$imageLink" ,"$price" ,"all")')
          .then((value) {
        //emit(SuccessInsertDataBaseState());
        print(" $value successfully inserted");
        getDatabase(database);
      }).catchError((error) {
        // emit(ErrorInsertDataBaseState());
        print(error);
      });
    });
  }
  List<Map> contactsListDb = [];
  List<Map> favoriteListDb = [];

  getDatabase(Database database) async {
    //emit(LoadingGetDataBaseState());
    contactsListDb.clear();
    favoriteListDb.clear();
    await database.rawQuery('SELECT * FROM Product').then((value) {
      for (Map<String, Object?> element in value) {
        contactsListDb.add(element);
        if (element['type'] == "favorite") {
          favoriteListDb.add(element);
        }
      }
      // emit(SuccessGetDataBaseState());
    }).catchError((error){
      print(error);
      // emit(ErrorGetDataBaseState());
    });

  }

}