import 'package:car_catalog/data/models/models.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavouriteListRepository {
  const FavouriteListRepository();

  Future<List<FavouriteModel>> getFavouriteList() async {
    final List<FavouriteModel> favouriteList = [];

    final favouriteModels = Hive.box("favourite_models");
    for (var model in favouriteModels.values) {
      favouriteList.add(model as FavouriteModel);
    }

    return favouriteList;
  }

  Future<bool> isOnFavouriteList(ModelModel model) async {
    final favouriteList = await getFavouriteList();
    for (var favouriteModel in favouriteList) {
      if (favouriteModel.model == model.model) {
        return true;
      }
    }
    return false;
  }

  void addModelToFavourite(BrandModel brandModel, ModelModel modelModel) {
    final favouriteModels = Hive.box("favourite_models");
    favouriteModels.add(FavouriteModel(
        name: brandModel.name, model: modelModel.model, url: modelModel.url));
  }

  void deleteModelFromFavourite(String modelName) {
    final favouriteModels = Hive.box("favourite_models");

    for (int i = 0; i < favouriteModels.length; i++) {
      final model = favouriteModels.getAt(i) as FavouriteModel;
      if (model.model == modelName) {
        favouriteModels.deleteAt(i);
      }
    }
  }
}
