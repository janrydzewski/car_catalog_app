import 'package:car_catalog/bloc/bloc.dart';
import 'package:car_catalog/bloc/blocs/favourite/favourite_bloc.dart';
import 'package:car_catalog/data/models/models.dart';
import 'package:car_catalog/resources/resources.dart';
import 'package:car_catalog/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              width: 375.w,
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
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          reusableText(favouriteList[index].name,
                              fontSize: 18,
                              fontColor: isDarkMode
                                  ? ColorProvider.mainTextDark
                                  : ColorProvider.mainTextLight),
                          reusableText(favouriteList[index].model,
                              fontSize: 15,
                              fontColor: isDarkMode
                                  ? ColorProvider.mainTextDark
                                  : ColorProvider.mainTextLight),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: GestureDetector(
                onTap: () {
                  context.read<FavouriteBloc>().add(
                      RemoveModelFromFavouriteEvent(
                          favouriteList[index].model));
                  context
                      .read<FavouriteListBloc>()
                      .add(const GetFavouriteListEvent());
                },
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
