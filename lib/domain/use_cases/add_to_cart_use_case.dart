import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/add_to_cart_response_entity.dart';
import 'package:e_commerce/domain/entities/errors.dart';
import 'package:e_commerce/domain/repository/repository/products_tab_repository_contract.dart';

class AddToCartUseCase {
  ProductsTabRepositoryContract repositoryDelegate;

  AddToCartUseCase({required this.repositoryDelegate});

  Future<Either<Errors, AddToCartResponseEntity>> invoke(String? productId) {
    return repositoryDelegate.addToCart(productId);
  }
}
