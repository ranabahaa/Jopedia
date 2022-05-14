abstract class HomeLayoutState {}

class HomeLayoutInitState extends HomeLayoutState {}

class BottomNavigationTrue extends HomeLayoutState {}

class GetUserDataLoading extends HomeLayoutState {}

class GetUserDataSuccsess extends HomeLayoutState {}

class GetUserDataError extends HomeLayoutState {
  final String error;

  GetUserDataError(this.error);
}