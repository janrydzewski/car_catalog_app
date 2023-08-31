

import 'package:bloc/bloc.dart';
import 'package:car_catalog/data/models/models.dart';
import 'package:car_catalog/repositories/repositories.dart';
import 'package:equatable/equatable.dart';

part 'favourite_list_event.dart';
part 'favourite_list_state.dart';

class FavouriteListBloc extends Bloc<FavouriteListEvent, FavouriteListState> {
  final FavouriteListRepository favouriteListRepository;
  FavouriteListBloc({required this.favouriteListRepository}) : super(FavouriteListState()) {
    on<GetFavouriteListEvent>(_onGetFavouriteListEvent);
  }

  _onGetFavouriteListEvent(GetFavouriteListEvent event, Emitter<FavouriteListState> emit) async {
    emit(FavouriteListLoading());
    try {
      final favouriteList = await favouriteListRepository.getFavouriteList();
      emit(state.copyWith(favouriteList: favouriteList));
    } catch (e) {
      emit(FavouriteListError(message: "Error fetching data"));
    }
  }

  
}
