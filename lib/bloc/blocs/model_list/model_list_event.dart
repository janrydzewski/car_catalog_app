part of 'model_list_bloc.dart';

class ModelListEvent extends Equatable {
  const ModelListEvent();

  @override
  List<Object> get props => [];
}

class GetModelListEvent extends ModelListEvent {
  final List<ModelModel> modelList;

  const GetModelListEvent(this.modelList);

  @override
  List<Object> get props => [];
}

class GetModelListSearchedEvent extends ModelListEvent {
  final String searchedText;
  final List<ModelModel> modelList;
  const GetModelListSearchedEvent(this.searchedText, this.modelList);

  @override
  List<Object> get props => [searchedText, modelList];
}
