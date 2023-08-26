import 'package:car_catalog/bloc/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'bloc/bloc.dart';
import 'routes/routes.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  MyRouter myRouter = MyRouter();

  runApp(MyApp(
    router: myRouter.router,
  ));
}

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApplicationBloc(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routeInformationProvider: router.routeInformationProvider,
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
          );
        },
      ),
    );
  }
}
