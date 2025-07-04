import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mucs/Data/repo/siginRepo.dart';

part 'sigin_event.dart';
part 'sigin_state.dart';

class SiginBloc extends Bloc<SiginEvent, SiginState> {
  SiginRepo _repo = SiginRepo();

  SiginBloc() : super(SiginInitial()) {
    on<SigninInitialEvent>((event, emit) async {
      emit(SiginLoadingState());
      try {
        await Future.delayed(Duration(seconds: 5));
        // String hasData = isntce.method
        if (await _repo.sigin(event.email, event.password)) {
          emit(SiginSuccessedState());
        } else {
          emit(SigninErrorState(errMsg: "Sign in error"));
        }
      } catch (e) {
        emit(SigninErrorState(errMsg: e.toString()));
      }
    });
  }
}
