import 'package:car_catalog/bloc/bloc.dart';
import 'package:car_catalog/resources/resources.dart';
import 'package:car_catalog/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SizedBox(
        width: 375.w,
        height: 812.h,
        child: Scaffold(
          backgroundColor: ColorProvider.mainBackground,
          appBar: reusableAppBar("Find your car brand"),
          body: SafeArea(
            child: Column(
              children: [
                reusableSearchBar(
                  textEditingController,
                  () {
                    textEditingController.clear();
                    context.read<CarBrandBloc>().add(const GetCarBrandEvent());
                  },
                  (value) {
                    context.read<CarBrandBloc>().add(
                          GetCarBrandSearchedEvent(value),
                        );
                  },
                ),
                Expanded(
                  child: BlocBuilder<CarBrandBloc, CarBrandState>(
                    builder: (context, state) {
                      if (state is CarBrandLoading) {
                        return const CircularProgressIndicator();
                      } else {
                        final carBrandList = state.carBrandList;
                        return reusableGridView(carBrandList);
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
