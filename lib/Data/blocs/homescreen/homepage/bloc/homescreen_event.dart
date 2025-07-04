part of 'homescreen_bloc.dart';

@immutable
sealed class HomescreenEvent {}

class HomeScreenInitialEvent extends HomescreenEvent {
  HomeScreenInitialEvent();
}
