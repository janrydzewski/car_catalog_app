part of 'application_bloc.dart';

class ApplicationState extends Equatable {
  final int index;

  const ApplicationState({this.index = 0});

  @override
  List<Object> get props => [index];
}

