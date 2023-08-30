import 'package:hive/hive.dart';

part 'favourite_model.g.dart';

@HiveType(typeId: 1)
class FavouriteModel {

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String model;

  @HiveField(2)
  final String url;

  FavouriteModel({required this.name, required this.model, required this.url});
}