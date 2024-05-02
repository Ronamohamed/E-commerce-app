import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/errors.dart';
import 'package:e_commerce/domain/entities/get_cart_response_entity.dart';
import 'package:e_commerce/domain/repository/repository/cart_repository_contract.dart';

class GetCartProductsUseCase {
  CartRepositoryContract repositoryDelegate;

  GetCartProductsUseCase({required this.repositoryDelegate});

  Future<Either<Errors, GetCartResponseEntity>> invoke() {
    return repositoryDelegate.getCartProducts();
  }
}
