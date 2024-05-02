import 'package:e_commerce/data/models_dto/response/categories_brands_response_dto.dart';
import 'package:e_commerce/domain/entities/products_response_entity.dart';

class ProductsResponseDTO extends ProductsResponseEntity {
  MetadataDTO? metadata;

  ProductsResponseDTO({
    super.results,
    this.metadata,
    super.data,
    super.message,
    super.statusMsg,
  });

  ProductsResponseDTO.fromJson(Map<String, dynamic> json) {
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["statusMsg"] is String) {
      statusMsg = json["statusMsg"];
    }
    if (json["results"] is num) {
      results = json["results"];
    }
    if (json["metadata"] is Map) {
      metadata = json["metadata"] == null
          ? null
          : MetadataDTO.fromJson(json["metadata"]);
    }
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => ProductDTO.fromJson(e)).toList();
    }
  }
}

class ProductDTO extends ProductEntity {
  String? createdAt;
  String? updatedAt;

  ProductDTO({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });

  ProductDTO.fromJson(Map<String, dynamic> json) {
    if (json["sold"] is num) {
      sold = json["sold"];
    }
    if (json["images"] is List) {
      images =
          json["images"] == null ? null : List<String>.from(json["images"]);
    }
    if (json["subcategory"] is List) {
      subcategory = json["subcategory"] == null
          ? null
          : (json["subcategory"] as List)
              .map((e) => SubcategoryDTO.fromJson(e))
              .toList();
    }
    if (json["ratingsQuantity"] is num) {
      ratingsQuantity = json["ratingsQuantity"];
    }
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["slug"] is String) {
      slug = json["slug"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["quantity"] is num) {
      quantity = json["quantity"];
    }
    if (json["price"] is num) {
      price = json["price"];
    }
    if (json["imageCover"] is String) {
      imageCover = json["imageCover"];
    }
    if (json["category"] is Map) {
      category = json["category"] == null
          ? null
          : CategoryBrandDTO.fromJson(json["category"]);
    }
    if (json["brand"] is Map) {
      brand = json["brand"] == null
          ? null
          : CategoryBrandDTO.fromJson(json["brand"]);
    }
    if (json["ratingsAverage"] is num) {
      ratingsAverage = json["ratingsAverage"];
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["id"] is String) {
      id = json["id"];
    }
  }
}

class SubcategoryDTO extends SubcategoryEntity {
  SubcategoryDTO({super.id, super.name, super.slug, super.category});

  SubcategoryDTO.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["slug"] is String) {
      slug = json["slug"];
    }
    if (json["category"] is String) {
      category = json["category"];
    }
  }
}

class MetadataDTO {
  num? currentPage;
  num? numberOfPages;
  num? limit;
  num? nextPage;

  MetadataDTO(
      {this.currentPage, this.numberOfPages, this.limit, this.nextPage});

  MetadataDTO.fromJson(Map<String, dynamic> json) {
    if (json["currentPage"] is num) {
      currentPage = json["currentPage"];
    }
    if (json["numberOfPages"] is num) {
      numberOfPages = json["numberOfPages"];
    }
    if (json["limit"] is num) {
      limit = json["limit"];
    }
    if (json["nextPage"] is num) {
      nextPage = json["nextPage"];
    }
  }
}
