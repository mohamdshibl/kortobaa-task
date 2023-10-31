import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/produt_model/product_model.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(): super(InitState());
  static CartCubit get(context) => BlocProvider.of(context);

  int counter = 1 ;


  List<Product> products= [];
  addProduct(Product product){
    products.add(product);
    print('shibllllll');
  }








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
}