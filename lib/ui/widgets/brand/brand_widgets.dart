import 'package:car_catalog/data/models/models.dart';
import 'package:car_catalog/resources/resources.dart';
import 'package:car_catalog/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

reusableListView(List<ModelModel> modelList) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
    child: ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          height: 120.h,
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: ColorProvider.thirdElement,
              borderRadius: BorderRadius.circular(25)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 150.w,
                child: Image.network(
                    "https://www.pngarts.com/files/11/Audi-A6-PNG-Image.png"),
              ),
              reusableText(modelList[index].model, fontSize: 15),
            ],
          ),
        );
      },
      itemCount: modelList.length,
    ),
  );
}
