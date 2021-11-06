class SuperHeroModel {
  int? id;
  String? name;
  String? photoName;

  SuperHeroModel({
    this.id,
    this.name,
    this.photoName
  });

//Con factory nos permite retornar un constructor nombrado como el siguiente
  factory SuperHeroModel.fromMap(Map<String, dynamic> map) {
    return SuperHeroModel(
      id          : map['id'],
      name        : map['name'],
      photoName   : map['slug']
    );
  }
}