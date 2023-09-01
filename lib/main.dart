import 'package:car_catalog/data/models/models.dart';
import 'package:car_catalog/repositories/repositories.dart';
import 'package:car_catalog/resources/resources.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'bloc/bloc.dart';
import 'routes/routes.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory());

  await Hive.initFlutter();
  Hive.registerAdapter(FavouriteModelAdapter());
  await Hive.openBox("favourite_models");

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
        RepositoryProvider(
          create: (context) => const FavouriteListRepository(),
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
          BlocProvider(
            create: (context) => ModelListBloc(
                carBrandRepository:
                    RepositoryProvider.of<CarBrandRepository>(context)),
          ),
          BlocProvider(
            create: (context) => FavouriteListBloc(
                favouriteListRepository:
                    RepositoryProvider.of<FavouriteListRepository>(context)),
          ),
          BlocProvider(
            create: (context) => FavouriteBloc(
                favouriteListRepository:
                    RepositoryProvider.of<FavouriteListRepository>(context)),
          ),
          BlocProvider(create: (context) => ThemeCubit()),
        ],
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, state) {
            return BlocBuilder<ThemeCubit, Brightness>(
              builder: (context, state) {
                final isDarkMode = state == Brightness.dark;
                return MaterialApp.router(
                  builder: (context, child) {
                    return ScrollConfiguration(
                      behavior: DisableGlow(),
                      child: child!,
                    );
                  },
                  theme: isDarkMode ? darkTheme : lightTheme,
                  debugShowCheckedModeBanner: false,
                  routeInformationProvider: router.routeInformationProvider,
                  routeInformationParser: router.routeInformationParser,
                  routerDelegate: router.routerDelegate,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
