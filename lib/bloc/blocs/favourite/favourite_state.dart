part of 'favourite_bloc.dart';

class FavouriteState extends Equatable {
  final bool isFavourite;

  FavouriteState({bool? isFavourite}) : isFavourite = isFavourite ?? false;

  FavouriteState copyWith({
    bool? isFavourite,
  }) {
    return FavouriteState(
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  @override
  List<Object> get props => [isFavourite];
}

class FavouriteLoading extends FavouriteState {}

class FavouriteError extends FavouriteState {
  final String message;

  FavouriteError({
    required this.message,
  }) : super();
}
