import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:car_catalog/resources/resources.dart';
import 'package:car_catalog/ui/ui.dart';

class Application extends StatefulWidget {
  final Widget child;

  const Application({super.key, required this.child});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375.w,
      height: 812.h,
      child: Scaffold(
        backgroundColor: ColorProvider.mainBackground,
        bottomNavigationBar: bottomNavigationBarWidget(),
        body: widget.child,
      ),
    );
  }
}
