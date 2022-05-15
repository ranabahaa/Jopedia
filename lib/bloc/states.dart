import 'package:meta/meta.dart';

@immutable
abstract class AppState {}

class InitialState extends AppState {}

class CreatJobLoading extends AppState {}

class CreatJobSuccess extends AppState {}

class CreatJobError extends AppState {
  final String message;

  CreatJobError({
    required this.message,
  });
}

class SuffixInitialState extends AppState {}

class SuffixVisible extends AppState {}

class SuffixVisibleOff extends AppState {}

class SendRequestLoading extends AppState {}

class SendRequestSuccess extends AppState {}

class SendRequestError extends AppState {
  final String message;

  SendRequestError({
    required this.message,
  });
}
class GetPostsDataLoading extends AppState {}

class GetPostsDataSuccsess extends AppState {}

class GetPostsDataError extends AppState {
  final String error;

  GetPostsDataError(this.error);
}
class HomeInitialState extends AppState {}

class SavedJobs extends AppState {}

class NearbyJobs extends AppState {}

class DurationJobs extends AppState {}




