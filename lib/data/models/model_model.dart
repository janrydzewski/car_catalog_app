class ModelModel {
  final int id;
  final String model;
  final String url;
  bool isFavourite;

  ModelModel({
    required this.id,
    required this.model,
    required this.url,
    this.isFavourite = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'model': model,
      'url': url,
      'isFavourite': false,
    };
  }

  static fromMap(Map<String, dynamic> map) {
    return ModelModel(
      id: map['id'] as int,
      model: map['model'] as String,
      url: map['url'] as String,
      isFavourite: false,
    );
  }
}
