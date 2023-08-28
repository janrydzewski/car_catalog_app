part of 'model_list_bloc.dart';

class ModelListState extends Equatable {
  final List<ModelModel> modelList;

  ModelListState({List<ModelModel>? modelList})
      : modelList = modelList ?? [];

  ModelListState copyWith({
    List<ModelModel>? modelList,
  }) {
    return ModelListState(
      modelList: modelList ?? this.modelList,
    );
  }

  @override
  List<Object> get props => [modelList];
}

class ModelListLoading extends ModelListState {}

class ModelListError extends ModelListState {
  final String message;

  ModelListError({
    List<ModelModel>? modelList,
    required this.message,
  }) : super(
    modelList: modelList,
  );
}
