class BrandModel {
  final int id;
  final String name;
  final String logo;

  const BrandModel({
    required this.id,
    required this.name,
    required this.logo,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
    };
  }

  static fromMap(Map<String, dynamic> map) {
    return BrandModel(
      id: map['id'] as int,
      name: map['name'] as String,
      logo: map['logo'] as String,
    );
  }
}
