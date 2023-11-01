
abstract class HomeStates {
}

class HomeInitialState extends HomeStates {}

class ChangeBtmNavState extends HomeStates {}


class HomeLoadingState extends HomeStates {}
class HomeSuccessState extends HomeStates {}
class HomeFailureState extends HomeStates {
  late final String errMessage;
  HomeFailureState({required this.errMessage});
}

class FetchProductLoadingState extends HomeStates {}
class FetchProductSuccessState extends HomeStates {}
class FetchProductFailureState extends HomeStates {
  late final String errMessage;
  FetchProductFailureState({required errMessage}) {
  }
}
class FetchCategoryLoadingState extends HomeStates {}
class FetchCategorySuccessState extends HomeStates {}
class FetchCategoryFailureState extends HomeStates {
  late final String errMessage;
  FetchCategoryFailureState({required errMessage}) {
  }
}
