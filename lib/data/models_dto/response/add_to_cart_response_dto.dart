import 'package:e_commerce/domain/entities/add_to_cart_response_entity.dart';

class AddToCartResponseDTO extends AddToCartResponseEntity {
  AddToCartResponseDTO({
    super.statusMsg,
    super.status,
    super.message,
    super.numOfCartItems,
    super.data,
  });

  AddToCartResponseDTO.fromJson(Map<String, dynamic> json) {
    if (json["statusMsg"] is String) {
      statusMsg = json["statusMsg"];
    }
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["numOfCartItems"] is num) {
      numOfCartItems = json["numOfCartItems"];
    }
    if (json["data"] is Map) {
      data = json["data"] == null ? null : AddToCartDTO.fromJson(json["data"]);
    }
  }
}

class AddToCartDTO extends AddToCartEntity {
  AddToCartDTO({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  AddToCartDTO.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["cartOwner"] is String) {
      cartOwner = json["cartOwner"];
    }
    if (json["products"] is List) {
      products = json["products"] == null
          ? null
          : (json["products"] as List)
              .map((e) => CartProductDTO.fromJson(e))
              .toList();
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["__v"] is num) {
      v = json["__v"];
    }
    if (json["totalCartPrice"] is num) {
      totalCartPrice = json["totalCartPrice"];
    }
  }
}

class CartProductDTO extends CartProductEntity {
  CartProductDTO({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  CartProductDTO.fromJson(Map<String, dynamic> json) {
    if (json["count"] is num) {
      count = json["count"];
    }
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["product"] is String) {
      product = json["product"];
    }
    if (json["price"] is num) {
      price = json["price"];
    }
  }
}
