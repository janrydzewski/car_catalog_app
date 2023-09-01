import 'package:car_catalog/bloc/bloc.dart';
import 'package:car_catalog/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

changeThemeWidget(bool isDarkMode) {
  return BlocBuilder<ThemeCubit, Brightness>(
    builder: (context, state) {
      final isDarkMode = state == Brightness.dark;
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        width: 375.w,
        height: 40.h,
        child: Switch(
              activeColor: isDarkMode
                  ? ColorProvider.thirdTextDark
                  : ColorProvider.thirdTextLight,
              value: state.index == 1 ? false : true,
              onChanged: (value) {
                context.read<ThemeCubit>().toggleTheme();
              },
            ),
      );
    },
  );
}