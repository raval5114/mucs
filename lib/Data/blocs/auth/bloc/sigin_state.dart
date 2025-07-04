part of 'sigin_bloc.dart';

@immutable
sealed class SiginState {}

final class SiginInitial extends SiginState {}

final class SiginLoadingState extends SiginState {}

final class SiginSuccessedState extends SiginState {
  SiginSuccessedState();
}

final class SigninErrorState extends SiginState {
  final String errMsg;

  SigninErrorState({required this.errMsg});
}
