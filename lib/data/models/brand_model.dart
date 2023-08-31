import 'package:car_catalog/data/models/models.dart';

class BrandModel {
  final int id;
  final String name;
  final String logo;
  final List<ModelModel> modelList;

  const BrandModel({
    required this.id,
    required this.name,
    required this.logo,
    required this.modelList,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
      'model': modelList,
    };
  }

  static fromMap(Map<String, dynamic> map) {
    List<ModelModel> models = <ModelModel>[];
    for (var model in map['models']) {
      models.add(ModelModel(
        id: model['id'] as int,
        model: model['model'] as String,
        url: model['url'] as String,
        isFavourite: false,
      ));
    }

    return BrandModel(
      id: map['id'] as int,
      name: map['name'] as String,
      logo: map['logo'] as String,
      modelList: models,
    );
  }
}
