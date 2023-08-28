import 'package:car_catalog/data/models/models.dart';
import 'package:car_catalog/resources/resources.dart';
import 'package:car_catalog/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';


reusableGridView(List<BrandModel> carBrandList) {
  return Padding(
    padding: EdgeInsets.symmetric(
        vertical: 5.h, horizontal: 20.w),
    child: GridView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.go('/home/brand',
                extra: carBrandList[index]);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: ColorProvider.thirdElement,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(carBrandList[index].logo),
                reusableText(carBrandList[index].name,
                    fontSize: 15),
              ],
            ),
          ),
        );
      },
      itemCount: carBrandList.length,
      gridDelegate:
      const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30),
    ),
  );
}