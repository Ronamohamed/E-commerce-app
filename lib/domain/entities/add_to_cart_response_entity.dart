class AddToCartResponseEntity {
  String? statusMsg;
  String? status;
  String? message;
  num? numOfCartItems;
  AddToCartEntity? data;

  AddToCartResponseEntity(
      {this.statusMsg,
      this.status,
      this.message,
      this.numOfCartItems,
      this.data});
}

class AddToCartEntity {
  String? id;
  String? cartOwner;
  List<CartProductEntity>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;

  AddToCartEntity(
      {this.id,
      this.cartOwner,
      this.products,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.totalCartPrice});
}

class CartProductEntity {
  num? count;
  String? id;
  String? product;
  num? price;

  CartProductEntity({this.count, this.id, this.product, this.price});
}
