import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/categories_response_entity.dart';
import 'package:e_commerce/domain/entities/errors.dart';

abstract class HomeTabRepositoryContract {
  Future<Either<Errors, CategoriesBrandsResponseEntity>> getAllCategories();

  Future<Either<Errors, CategoriesBrandsResponseEntity>> getAllBrands();
}
