import 'package:e_commerce/domain/entities/categories_response_entity.dart';

class ProductsResponseEntity {
  String? message;
  String? statusMsg;
  num? results;
  List<ProductEntity>? data;

  ProductsResponseEntity(
      {this.results, this.data, this.message, this.statusMsg});
}

class ProductEntity {
  num? sold;
  List<String>? images;
  List<SubcategoryEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  CategoryBrandEntity? category;
  CategoryBrandEntity? brand;
  num? ratingsAverage;

  ProductEntity({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });
}

class SubcategoryEntity {
  String? id;
  String? name;
  String? slug;
  String? category;

  SubcategoryEntity({this.id, this.name, this.slug, this.category});
}
