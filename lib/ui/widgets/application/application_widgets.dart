import 'package:car_catalog/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:car_catalog/resources/resources.dart';
import 'package:go_router/go_router.dart';

Widget bottomNavigationBarWidget() {
  return BlocBuilder<ApplicationBloc, ApplicationState>(
    builder: (context, state) {
      return Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Container(
          height: 60,
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          decoration: const BoxDecoration(
              color: ColorProvider.fourthElement,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  state.index == 0
                      ? Icons.widgets_rounded
                      : Icons.widgets_outlined,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  context.go('/home');
                  context
                      .read<ApplicationBloc>()
                      .add(ChangeApplicationEvent(0));
                },
              ),
              IconButton(
                icon: Icon(
                  state.index == 1
                      ? Icons.favorite_outlined
                      : Icons.favorite_outline_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  context.go('/favourite');
                  context
                      .read<ApplicationBloc>()
                      .add(ChangeApplicationEvent(1));
                },
              ),
              IconButton(
                icon: Icon(
                  state.index == 2
                      ? Icons.settings_rounded
                      : Icons.settings_outlined,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  context.go('/settings');
                  context
                      .read<ApplicationBloc>()
                      .add(ChangeApplicationEvent(2));
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

