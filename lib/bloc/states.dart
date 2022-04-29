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