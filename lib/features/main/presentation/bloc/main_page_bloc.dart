import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(const MainPageInitial(tabIndex: 0)) {
    on<MainPageEvent>((event, emit) {
      if (event is TabChange) {
        emit(MainPageInitial(tabIndex: event.tabIndex));
      }
    });
  }
}
