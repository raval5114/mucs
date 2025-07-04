part of 'homescreen_bloc.dart';

@immutable
sealed class HomescreenState {}

final class HomescreenInitial extends HomescreenState {}

final class HomeScreenLoadingState extends HomescreenState {}

final class HomeScreenSucessState extends HomescreenState {
  final List<Map<String, dynamic>> data;

  HomeScreenSucessState({required this.data});
}

final class HomeScreenErrorState extends HomescreenState {
  final String errMsg;

  HomeScreenErrorState({required this.errMsg});
}
