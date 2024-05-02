class CategoriesBrandsResponseEntity {
  int? results;
  List<CategoryBrandEntity>? data;

  CategoriesBrandsResponseEntity({this.results, this.data});
}

class CategoryBrandEntity {
  String? id;
  String? name;
  String? slug;
  String? image;

  CategoryBrandEntity({this.id, this.name, this.slug, this.image});
}
