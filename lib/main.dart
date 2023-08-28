import 'package:car_catalog/repositories/repositories.dart';
import 'package:car_catalog/resources/resources.dart';
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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => const CarBrandRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ApplicationBloc(),
          ),
          BlocProvider(
            create: (context) => CarBrandBloc(
                carBrandRepository:
                    RepositoryProvider.of<CarBrandRepository>(context)),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, state) {
            return MaterialApp.router(
              builder: (context, child) {
                return ScrollConfiguration(
                  behavior: DisableGlow(),
                  child: child!,
                );
              },
              theme: ThemeData(
                brightness: Brightness.light,
                scaffoldBackgroundColor: ColorProvider.mainBackground,
                appBarTheme: const AppBarTheme(
                  elevation: 0,
                  backgroundColor: ColorProvider.mainBackground,
                  iconTheme: IconThemeData(
                    color: ColorProvider.mainText,
                  ),
                ),
              ),
              debugShowCheckedModeBanner: false,
              routeInformationProvider: router.routeInformationProvider,
              routeInformationParser: router.routeInformationParser,
              routerDelegate: router.routerDelegate,
            );
          },
        ),
      ),
    );
  }
}
