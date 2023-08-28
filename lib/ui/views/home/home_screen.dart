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
                Container(
                  width: 375.w,
                  margin:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
                  child: TextFormField(
                    controller: textEditingController,
                    cursorColor: ColorProvider.fourthElement,
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      hoverColor: ColorProvider.fourthElement,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: ColorProvider.fourthElement,
                        ),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: ColorProvider.fourthElement,
                        ),
                      ),
                      hintStyle: GoogleFonts.notoSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ColorProvider.secondaryText,
                        letterSpacing: 1,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          textEditingController.clear();
                          context
                              .read<CarBrandBloc>()
                              .add(const GetCarBrandEvent());
                        },
                        icon: const Icon(Icons.close, color: ColorProvider.mainText),
                      ),
                    ),
                    onChanged: (value) {
                      context
                          .read<CarBrandBloc>()
                          .add(GetCarBrandSearchedEvent(value));
                    },
                  ),
                ),
                Expanded(
                  child: BlocBuilder<CarBrandBloc, CarBrandState>(
                    builder: (context, state) {
                      if (state is CarBrandLoading) {
                        return const CircularProgressIndicator();
                      } else {
                        final carBrandList = state.carBrandList;
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 20.w),
                          child: GridView.builder(
                            itemBuilder: (context, index) {
                              return Container(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
