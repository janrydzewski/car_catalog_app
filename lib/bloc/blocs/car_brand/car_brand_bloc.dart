import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:car_catalog/data/models/models.dart';
import 'package:car_catalog/repositories/repositories.dart';
import 'package:equatable/equatable.dart';

part 'car_brand_event.dart';

part 'car_brand_state.dart';

class CarBrandBloc extends Bloc<CarBrandEvent, CarBrandState> {
  final CarBrandRepository carBrandRepository;

  CarBrandBloc({required this.carBrandRepository}) : super(CarBrandState()) {
    on<GetCarBrandEvent>(_onGetCarBrandEvent);
    on<GetCarBrandSearchedEvent>(_onGetCarBrandSearchedEvent);
  }

  _onGetCarBrandEvent(
      GetCarBrandEvent event, Emitter<CarBrandState> emit) async {
    emit(CarBrandLoading());
    try {
      final carBrandList = await carBrandRepository.getCarBrandList();
      emit(state.copyWith(carBrandList: carBrandList));
    } catch (e) {
      emit(CarBrandError(message: "Error fetching data"));
    }
  }

  _onGetCarBrandSearchedEvent(
      GetCarBrandSearchedEvent event, Emitter<CarBrandState> emit) async {
    emit(CarBrandLoading());
    try {
      final carBrandList = await carBrandRepository.getCarBrandSearchedList(event.searchedText);
      emit(state.copyWith(carBrandList: carBrandList));
    } catch (e) {
      emit(CarBrandError(message: "Error fetching data"));
    }
  }
}
