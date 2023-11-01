

abstract class CartState {


}

class InitState extends CartState{

}
class PlusCounterState extends CartState {

}
class MinusCounterState extends CartState {

}class FetchProductIdLoadingState extends CartState {}
class FetchProductIdSuccessState extends CartState {}
class FetchProductIdFailureState extends CartState {
  late final String errMessage;
  FetchProductFailureState({required errMessage}) {
  }
}