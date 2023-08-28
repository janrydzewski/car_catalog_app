part of 'car_brand_bloc.dart';

class CarBrandEvent extends Equatable {
  const CarBrandEvent();

  @override
  List<Object> get props => [];
}

class GetCarBrandEvent extends CarBrandEvent {
  const GetCarBrandEvent();

  @override
  List<Object> get props => [];
}

class GetCarBrandSearchedEvent extends CarBrandEvent {
  final String searchedText;
  const GetCarBrandSearchedEvent(this.searchedText);

  @override
  List<Object> get props => [searchedText];
}

