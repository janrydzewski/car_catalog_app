import 'dart:convert';

import 'package:car_catalog/data/models/models.dart';
import 'package:flutter/services.dart';

class CarBrandRepository {
  const CarBrandRepository();

  Future<List<BrandModel>> getCarBrandList() async {
    final List<BrandModel> carBrandList = [];

    final String response =
        await rootBundle.loadString("assets/data/car_list.json");
    final data = await json.decode(response);

    for (var car in data['cars']) {
      carBrandList.add(BrandModel.fromMap(car));
    }

    return carBrandList;
  }
}
