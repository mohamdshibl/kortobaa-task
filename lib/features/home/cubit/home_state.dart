
abstract class HomeStates {
}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}
class HomeSuccessState extends HomeStates {}
class HomeFailureState extends HomeStates {
  late final String errMessage;
  HomeFailureState({required this.errMessage});
}