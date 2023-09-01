import 'package:car_catalog/bloc/bloc.dart';
import 'package:car_catalog/resources/resources.dart';
import 'package:car_catalog/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    context.read<CarBrandBloc>().add(const GetCarBrandEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<ThemeCubit>().state;
    final isDarkMode = state == Brightness.dark;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SizedBox(
        width: 375.w,
        height: 812.h,
        child: Scaffold(
          backgroundColor: isDarkMode
              ? ColorProvider.mainBackgroundDark
              : ColorProvider.mainBackgroundLight,
          appBar: reusableAppBar(
            "Find your car brand",
            isDarkMode
                ? ColorProvider.mainTextDark
                : ColorProvider.mainTextLight,
          ),
          body: SafeArea(
            child: Column(
              children: [
                reusableSearchBar(textEditingController, () {
                  textEditingController.clear();
                  context.read<CarBrandBloc>().add(const GetCarBrandEvent());
                }, (value) {
                  context.read<CarBrandBloc>().add(
                        GetCarBrandSearchedEvent(value),
                      );
                }, isDarkMode),
                Container(
                  alignment: Alignment.centerLeft,
                  margin:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                  child: reusableText(
                    "All brands",
                    fontSize: 16,
                    fontColor: isDarkMode
                        ? ColorProvider.thirdTextDark
                        : ColorProvider.thirdTextLight,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
                Expanded(
                  child: BlocBuilder<CarBrandBloc, CarBrandState>(
                    builder: (context, state) {
                      if (state is CarBrandLoading) {
                        return CircularProgressIndicator(
                          color: isDarkMode
                              ? ColorProvider.mainElementDark
                              : ColorProvider.mainElementLight,
                        );
                      } else {
                        final carBrandList = state.carBrandList;
                        return reusableGridView(carBrandList, isDarkMode);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
