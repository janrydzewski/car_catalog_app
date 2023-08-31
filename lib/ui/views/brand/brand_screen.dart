import 'package:car_catalog/bloc/bloc.dart';
import 'package:car_catalog/data/models/models.dart';
import 'package:car_catalog/resources/resources.dart';
import 'package:car_catalog/ui/widgets/brand/brand.dart';
import 'package:car_catalog/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandScreen extends StatefulWidget {
  final BrandModel brandModel;

  const BrandScreen({super.key, required this.brandModel});

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = context.read<ThemeCubit>().state;
    final isDarkMode = state == Brightness.dark;
    return SizedBox(
      width: 375.w,
      height: 812.h,
      child: Scaffold(
        appBar: reusableAppBar(widget.brandModel.name),
        backgroundColor: isDarkMode
            ? ColorProvider.mainBackgroundDark
            : ColorProvider.mainBackgroundLight,
        body: SafeArea(
          child: Column(
            children: [
              reusableSearchBar(
                textEditingController,
                () {
                  textEditingController.clear();
                },
                (value) {},
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 15.h, bottom: 45.h),
                  child: reusableListView(
                      widget.brandModel, widget.brandModel.modelList),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
