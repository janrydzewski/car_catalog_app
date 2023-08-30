import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver{


  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print(error);
  }

  @override
  void onTransition(
      Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
        super.onTransition(bloc, transition);
    print(transition);
  }
}