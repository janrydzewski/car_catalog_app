

import 'package:bloc/bloc.dart';
import 'package:car_catalog/data/models/models.dart';
import 'package:equatable/equatable.dart';

part 'favourite_list_event.dart';
part 'favourite_list_state.dart';

class FavouriteListBloc extends Bloc<FavouriteListEvent, FavouriteListState> {
  FavouriteListBloc() : super(FavouriteListState()) {
    //on<GetModelListEvent>(_onGetModelListEvent);
  }

  // _onGetModelListEvent(GetModelListEvent event, Emitter<FavouriteListState> emit) {
  //   emit(ModelListLoading());
  //   try{
  //     final modelList = state.modelList;
  //   }
  // }
}
