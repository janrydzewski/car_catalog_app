part of 'application_bloc.dart';

class ApplicationEvent {
  const ApplicationEvent();
}

class ChangeApplicationEvent extends ApplicationEvent {
  int index;

  ChangeApplicationEvent(this.index);
}