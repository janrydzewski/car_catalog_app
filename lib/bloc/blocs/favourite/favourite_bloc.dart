import 'package:bloc/bloc.dart';
import 'package:car_catalog/data/models/models.dart';
import 'package:car_catalog/repositories/repositories.dart';
import 'package:equatable/equatable.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final FavouriteListRepository favouriteListRepository;
  FavouriteBloc({required this.favouriteListRepository}) : super(FavouriteState()) {
    on<GetInitialValueEvent>(_onGetInitialValueEvent);
    on<AddRemoveModelEvent>(_onAddRemoveModelEvent);
  }

  _onGetInitialValueEvent(GetInitialValueEvent event, Emitter<FavouriteState> emit) async {
    emit(FavouriteLoading());
    try {
      final isFavourite = await favouriteListRepository.isOnFavouriteList(event.modelModel);
      emit(state.copyWith(isFavourite: isFavourite));
    } catch (e) {
      emit(FavouriteError(message: "Error fetching data"));
    }
  }

  _onAddRemoveModelEvent(AddRemoveModelEvent event, Emitter<FavouriteState> emit) async {
    emit(FavouriteLoading());
    try {
      final isFavourite = await favouriteListRepository.isOnFavouriteList(event.modelModel);
      if(isFavourite){
        favouriteListRepository.deleteModelFromFavourite(event.brandModel, event.modelModel);

        print("delete");
      }
      else{
        favouriteListRepository.addModelToFavourite(event.brandModel, event.modelModel);
        print("add");
      }
      emit(state.copyWith(isFavourite: !isFavourite));
    } catch (e) {
      emit(FavouriteError(message: "Error fetching data"));
    }
  }
}
