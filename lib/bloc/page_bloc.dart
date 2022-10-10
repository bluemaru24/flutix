import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(OnInitialPage()) {
    on<PageEvent>((event, emit) {
      if (event is GoToSplashPage) {
        OnSplashPage();
      } else if (event is GoToLoginPage) {
        OnLoginPage();
      } else if (event is GoToMainPage) {
        OnMainPage();
      }
    });
  }
}
