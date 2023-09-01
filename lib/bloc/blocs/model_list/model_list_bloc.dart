
import 'package:bloc/bloc.dart';
import 'package:car_catalog/data/models/models.dart';
import 'package:car_catalog/repositories/repositories.dart';
import 'package:equatable/equatable.dart';

part 'model_list_event.dart';
part 'model_list_state.dart';

class ModelListBloc extends Bloc<ModelListEvent, ModelListState> {
  final CarBrandRepository carBrandRepository;
  ModelListBloc({required this.carBrandRepository}) : super(ModelListState()) {
    on<GetModelListEvent>(_onGetModelListEvent);
    on<GetModelListSearchedEvent>(_onGetModelListSearchedEvent);
  }

  _onGetModelListEvent(
      GetModelListEvent event, Emitter<ModelListState> emit) async {
    emit(ModelListLoading());
    try {
      emit(state.copyWith(modelList: event.modelList));
    } catch (e) {
      emit(ModelListError(message: "Error fetching data"));
    }
  }

  _onGetModelListSearchedEvent(
      GetModelListSearchedEvent event, Emitter<ModelListState> emit) async {
    emit(ModelListLoading());
    try {
      final modelList = await carBrandRepository.getModelSearchedList(event.searchedText, event.modelList);
      emit(state.copyWith(modelList: modelList));
    } catch (e) {
      emit(ModelListError(message: "Error fetching data"));
    }
  }
}
