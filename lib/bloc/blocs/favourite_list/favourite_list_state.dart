part of 'favourite_list_bloc.dart';

class FavouriteListState extends Equatable {
  final List<FavouriteModel> favouriteList;

  FavouriteListState({List<FavouriteModel>? favouriteList})
      : favouriteList = favouriteList ?? [];

  FavouriteListState copyWith({
    List<FavouriteModel>? favouriteList,
  }) {
    return FavouriteListState(
      favouriteList: favouriteList ?? this.favouriteList,
    );
  }

  @override
  List<Object> get props => [favouriteList];
}

class FavouriteListLoading extends FavouriteListState {}

class FavouriteListError extends FavouriteListState {
  final String message;

  FavouriteListError({
    List<FavouriteModel>? favouriteList,
    required this.message,
  }) : super(
    favouriteList: favouriteList,
  );
}
