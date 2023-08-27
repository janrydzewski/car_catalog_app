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
  @override
  void initState() {
    context.read<CarBrandBloc>().add(GetCarBrandEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375.w,
      height: 812.h,
      child: Scaffold(
        backgroundColor: ColorProvider.mainBackground,
        body: SafeArea(
          child: BlocBuilder<CarBrandBloc, CarBrandState>(
            builder: (context, state) {
              if (state is CarBrandLoading) {
                return CircularProgressIndicator();
              } else {
                final carBrandList = state.carBrandList;
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
                  child: GridView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: ColorProvider.fourthElement,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(carBrandList[index].logo),
                            reusableText(carBrandList[index].name,
                                fontSize: 15),
                          ],
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
            },
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     context.rea
        //   },
        //   child: Text("Press"),
        // ),
      ),
    );
  }
}
