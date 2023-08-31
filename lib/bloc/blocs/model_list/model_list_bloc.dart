
import 'package:bloc/bloc.dart';
import 'package:car_catalog/data/models/models.dart';
import 'package:equatable/equatable.dart';

part 'model_list_event.dart';
part 'model_list_state.dart';

class ModelListBloc extends Bloc<ModelListEvent, ModelListState> {
  ModelListBloc() : super(ModelListState()) {
    //on<GetModelListEvent>(_onGetModelListEvent);
  }

  // _onGetModelListEvent(GetModelListEvent event, Emitter<ModelListState> emit) {
  //   emit(ModelListLoading());
  //   try{
  //     final modelList = state.modelList;
  //   }
  // }
}
