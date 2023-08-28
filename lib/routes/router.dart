import 'package:car_catalog/data/models/models.dart';
import 'package:car_catalog/resources/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:car_catalog/ui/ui.dart';

class MyRouter {
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  late final GoRouter router = GoRouter(
    initialLocation: '/home',
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return Application(
            child: child,
          );
        },
        routes: <RouteBase>[
          GoRoute(
            name: 'Home',
            path: '/home',
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: HomeScreen(),
              );
            },
            routes: <RouteBase>[
              GoRoute(
                  name: 'Brand',
                  path: 'brand',
                  pageBuilder: (context, state) {
                    final carBrand = state.extra as BrandModel;
                    return NoTransitionPage(
                      child: BrandScreen(brandModel: carBrand),
                    );
                  },
              ),
            ]
          ),
          GoRoute(
            name: 'Favourite',
            path: '/favourite',
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: Center(
                  child: Text(
                    "Favourite",
                    style: TextStyle(color: ColorProvider.mainText),
                  ),
                ),
              );
            },
          ),
          GoRoute(
            name: 'Settings',
            path: '/settings',
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: Center(
                  child: Text(
                    "Settings",
                    style: TextStyle(color: ColorProvider.mainText),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) => CustomTransitionPage(
      child: const Center(
        child: Text("Error"),
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    ),
  );
}
