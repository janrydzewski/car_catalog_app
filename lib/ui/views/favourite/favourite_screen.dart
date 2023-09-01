import 'package:car_catalog/bloc/bloc.dart';
import 'package:car_catalog/resources/colors/colors.dart';
import 'package:car_catalog/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    context.read<FavouriteListBloc>().add(const GetFavouriteListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<ThemeCubit>().state;
    final isDarkMode = state == Brightness.dark;
    return SizedBox(
      width: 375.w,
      height: 812.h,
      child: Scaffold(
        backgroundColor: isDarkMode
            ? ColorProvider.mainBackgroundDark
            : ColorProvider.mainBackgroundLight,
        appBar: reusableAppBar(
          "Favourite models",
          isDarkMode ? ColorProvider.mainTextDark : ColorProvider.mainTextLight,
        ),
        body: SafeArea(
          child: BlocBuilder<FavouriteListBloc, FavouriteListState>(
            builder: (context, state) {
              if (state is FavouriteListLoading) {
                return const CircularProgressIndicator();
              } else {
                final favouriteList = state.favouriteList;
                return favouriteList.isNotEmpty
                    ? reusableFavouriteListView(favouriteList, isDarkMode)
                    : Container(
                        alignment: Alignment.center,
                        child: reusableText(
                          "You don't have any liked models of cars yet",
                          fontSize: 14,
                          fontColor: isDarkMode
                              ? ColorProvider.mainTextDark
                              : ColorProvider.mainTextLight,
                        ),
                      );
              }
            },
          ),
        ),
      ),
    );
  }
}
