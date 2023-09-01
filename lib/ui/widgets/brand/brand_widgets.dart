import 'package:car_catalog/bloc/bloc.dart';
import 'package:car_catalog/data/models/models.dart';
import 'package:car_catalog/repositories/repositories.dart';
import 'package:car_catalog/resources/resources.dart';
import 'package:car_catalog/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

reusableListView(BrandModel brandModel, List<ModelModel> modelList) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
    child: ListView.builder(
      itemBuilder: (context, index) {
        return ListViewItem(
            brandModel: brandModel, modelModel: modelList[index]);
      },
      itemCount: modelList.length,
    ),
  );
}

class ListViewItem extends StatefulWidget {
  final BrandModel brandModel;
  final ModelModel modelModel;
  const ListViewItem(
      {super.key, required this.brandModel, required this.modelModel});

  @override
  State<ListViewItem> createState() => _ListViewItemState();
}

class _ListViewItemState extends State<ListViewItem> {
  late FavouriteBloc favouriteBloc;

  @override
  void initState() {
    favouriteBloc = FavouriteBloc(
        favouriteListRepository:
            RepositoryProvider.of<FavouriteListRepository>(context));
    favouriteBloc.add(GetInitialValueEvent(widget.modelModel));

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final state = context.read<ThemeCubit>().state;
    final isDarkMode = state == Brightness.dark;
    return BlocBuilder<FavouriteBloc, FavouriteState>(
      bloc: favouriteBloc,
      builder: (context, state) {
        if (state is FavouriteLoading) {
          return CircularProgressIndicator(color: isDarkMode ? ColorProvider.mainElementDark : ColorProvider.mainElementLight,);
        } else {
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
                        child: reusableText(widget.modelModel.model,
                            fontSize: 15,
                            fontColor: isDarkMode
                                ? ColorProvider.mainTextDark
                                : ColorProvider.mainTextLight),
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
                    favouriteBloc.add(AddRemoveModelEvent(
                        widget.brandModel, widget.modelModel));
                    print(
                        "current: ${widget.modelModel.model}  ${widget.modelModel.isFavourite}");
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
                      state.isFavourite
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: isDarkMode
                          ? ColorProvider.mainTextDark
                          : ColorProvider.mainTextLight,
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
