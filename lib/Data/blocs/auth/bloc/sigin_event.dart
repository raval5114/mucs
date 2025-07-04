part of 'sigin_bloc.dart';

@immutable
sealed class SiginEvent {}

class SigninInitialEvent extends SiginEvent {
  final String email;
  final String password;

  SigninInitialEvent({required this.email, required this.password});
}

class FetchingUserDataEvent extends SiginEvent {}
