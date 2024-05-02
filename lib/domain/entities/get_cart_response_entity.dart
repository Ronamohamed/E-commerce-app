import 'package:e_commerce/domain/entities/products_response_entity.dart';

class GetCartResponseEntity {
  String? status;
  int? numOfCartItems;
  GetCartDataEntity? data;

  GetCartResponseEntity({this.status, this.numOfCartItems, this.data});
}

class GetCartDataEntity {
  String? id;
  String? cartOwner;
  List<CartProductsEntity>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;

  GetCartDataEntity(
      {this.id,
      this.cartOwner,
      this.products,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.totalCartPrice});
}

class CartProductsEntity {
  int? count;
  String? id;
  ProductEntity? product;
  num? price;

  CartProductsEntity({this.count, this.id, this.product, this.price});
}
