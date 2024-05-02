import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/errors.dart';
import 'package:e_commerce/domain/entities/products_response_entity.dart';
import 'package:e_commerce/domain/repository/repository/products_tab_repository_contract.dart';

class GetAllProductsUseCase {
  ProductsTabRepositoryContract repositoryDelegate;

  GetAllProductsUseCase({required this.repositoryDelegate});

  Future<Either<Errors, ProductsResponseEntity>> invoke() {
    return repositoryDelegate.getAllProducts();
  }
}
