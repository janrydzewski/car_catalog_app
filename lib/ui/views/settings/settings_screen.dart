import 'package:car_catalog/bloc/bloc.dart';
import 'package:car_catalog/resources/resources.dart';
import 'package:car_catalog/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, Brightness>(
      builder: (context, state) {
        final isDarkMode = state == Brightness.dark;
        return SizedBox(
          height: 812.h,
          width: 375.w,
          child: Scaffold(
            appBar: reusableAppBar(
              "Settings",
              isDarkMode
                  ? ColorProvider.mainTextDark
                  : ColorProvider.mainTextLight,
            ),
            backgroundColor: isDarkMode
                ? ColorProvider.mainBackgroundDark
                : ColorProvider.mainBackgroundLight,
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: reusableText(
                      "Change your app theme",
                      fontSize: 18,
                      fontColor: isDarkMode
                          ? ColorProvider.mainTextDark
                          : ColorProvider.mainTextLight,
                    ),
                  ),
                  changeThemeWidget(isDarkMode),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
