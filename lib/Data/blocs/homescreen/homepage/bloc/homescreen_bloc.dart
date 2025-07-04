import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mucs/Data/repo/homepagerepo/homepagerepo.dart';

part 'homescreen_event.dart';
part 'homescreen_state.dart';

class HomescreenBloc extends Bloc<HomescreenEvent, HomescreenState> {
  HomescreenBloc() : super(HomescreenInitial()) {
    on<HomeScreenInitialEvent>((event, emit) async {
      try {
        emit(HomeScreenLoadingState());
        Future.delayed(Duration(seconds: 2));
        Homepagerepo _repo = Homepagerepo();
        List<Map<String, dynamic>> data = await _repo.getData();
        emit(HomeScreenSucessState(data: data));
      } catch (e) {
        print('Error: $e');
        emit(HomeScreenErrorState(errMsg: e.toString()));
      }
    });
  }
}
