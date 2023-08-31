part of 'favourite_bloc.dart';

class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class GetInitialValueEvent extends FavouriteEvent {
  final ModelModel modelModel;
  const GetInitialValueEvent(this.modelModel);

  @override
  List<Object> get props => [modelModel];
}

class AddRemoveModelEvent extends FavouriteEvent {
  final BrandModel brandModel;
  final ModelModel modelModel;
  const AddRemoveModelEvent(this.brandModel, this.modelModel);

  @override
  List<Object> get props => [brandModel, modelModel];
}
