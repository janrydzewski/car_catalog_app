import 'package:car_catalog/resources/resources.dart';
import 'package:flutter/material.dart';


final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: ColorProvider.mainBackgroundLight,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: ColorProvider.mainBackgroundLight,
    iconTheme: IconThemeData(
      color: ColorProvider.mainTextLight,
    ),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: ColorProvider.mainBackgroundDark,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: ColorProvider.mainBackgroundDark,
    iconTheme: IconThemeData(
      color: ColorProvider.mainTextDark,
    ),
  ),
);