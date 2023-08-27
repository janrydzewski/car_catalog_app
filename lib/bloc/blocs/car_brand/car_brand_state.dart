part of 'car_brand_bloc.dart';

class CarBrandState extends Equatable {
  final List<BrandModel> carBrandList;

  CarBrandState({List<BrandModel>? carBrandList})
      : carBrandList = carBrandList ?? [];

  CarBrandState copyWith({
    List<BrandModel>? carBrandList,
  }) {
    return CarBrandState(
      carBrandList: carBrandList ?? this.carBrandList,
    );
  }

  @override
  List<Object> get props => [carBrandList];
}

class CarBrandLoading extends CarBrandState {}

class CarBrandError extends CarBrandState {
  final String message;

  CarBrandError({
    List<BrandModel>? carBrandList,
    required this.message,
  }) : super(
          carBrandList: carBrandList,
        );
}
