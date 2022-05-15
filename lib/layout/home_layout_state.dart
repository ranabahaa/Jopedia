abstract class HomeLayoutState {}

class HomeLayoutInitState extends HomeLayoutState {}

class BottomNavigationTrue extends HomeLayoutState {}

class GetUserDataLoading extends HomeLayoutState {}

class GetUserDataSuccsess extends HomeLayoutState {}

class GetUserDataError extends HomeLayoutState {
  final String error;

  GetUserDataError(this.error);
}
class GetPostsDataLoading extends HomeLayoutState {}

class GetPostsDataSuccsess extends HomeLayoutState {}

class GetPostsDataError extends HomeLayoutState {
  final String error;

  GetPostsDataError(this.error);
}