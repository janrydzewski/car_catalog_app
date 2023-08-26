import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'application_event.dart';

part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(ApplicationState(index: 0)) {
    on<ChangeApplicationEvent>(_onChangeApplicationEvent);
  }

  _onChangeApplicationEvent(
      ChangeApplicationEvent event, Emitter<ApplicationState> emit) {
    emit(ApplicationState(index: event.index));
  }
}
