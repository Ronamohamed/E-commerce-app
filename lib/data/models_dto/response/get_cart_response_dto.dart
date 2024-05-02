import 'package:e_commerce/data/models_dto/response/products_response_dto.dart';
import 'package:e_commerce/domain/entities/get_cart_response_entity.dart';

class GetCartResponseDTO extends GetCartResponseEntity {
  String? message;
  String? statusMsg;

  GetCartResponseDTO({super.status, super.numOfCartItems, super.data});

  GetCartResponseDTO.fromJson(Map<String, dynamic> json) {
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["numOfCartItems"] is int) {
      numOfCartItems = json["numOfCartItems"];
    }
    if (json["data"] is Map) {
      data =
          json["data"] == null ? null : GetCartDataDTO.fromJson(json["data"]);
    }
  }
}

class GetCartDataDTO extends GetCartDataEntity {
  GetCartDataDTO(
      {super.id,
      super.cartOwner,
      super.products,
      super.createdAt,
      super.updatedAt,
      super.v,
      super.totalCartPrice});

  GetCartDataDTO.fromJson(Map<String, dynamic> json) {
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
              .map((e) => CartProductsDTO.fromJson(e))
              .toList();
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["__v"] is int) {
      v = json["__v"];
    }
    if (json["totalCartPrice"] is int) {
      totalCartPrice = json["totalCartPrice"];
    }
  }
}

class CartProductsDTO extends CartProductsEntity {
  CartProductsDTO({super.count, super.id, super.product, super.price});

  CartProductsDTO.fromJson(Map<String, dynamic> json) {
    if (json["count"] is int) {
      count = json["count"];
    }
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["product"] is Map) {
      product =
          json["product"] == null ? null : ProductDTO.fromJson(json["product"]);
    }
    if (json["price"] is num) {
      price = json["price"];
    }
  }
}
