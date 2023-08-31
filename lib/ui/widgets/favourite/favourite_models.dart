import 'package:car_catalog/data/models/models.dart';
import 'package:car_catalog/resources/resources.dart';
import 'package:car_catalog/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

reusableFavouriteListView(List<FavouriteModel> favouriteList, bool isDarkMode) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
    child: ListView.builder(
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              height: 120.h,
              margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: isDarkMode
                      ? ColorProvider.mainElementDark
                      : ColorProvider.mainElementLight,
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 150.w,
                    child: Image.network(
                        "https://www.pngarts.com/files/11/Audi-A6-PNG-Image.png"),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      reusableText(favouriteList[index].name, fontSize: 18),
                      reusableText(favouriteList[index].model, fontSize: 15),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 30.w,
                  height: 30.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: isDarkMode
                        ? ColorProvider.mainElementDark
                        : ColorProvider.mainElementLight,
                    border: Border.all(
                        color: isDarkMode
                            ? ColorProvider.secondaryElementDark
                            : ColorProvider.secondaryElementLight),
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: isDarkMode
                        ? ColorProvider.mainTextDark
                        : ColorProvider.mainTextLight,
                  ),
                ),
              ),
            )
          ],
        );
      },
      itemCount: favouriteList.length,
    ),
  );
}
