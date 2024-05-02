import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/errors.dart';
import 'package:e_commerce/domain/entities/get_cart_response_entity.dart';
import 'package:e_commerce/domain/repository/repository/cart_repository_contract.dart';

class DeleteProductFromCartUseCase {
  CartRepositoryContract repositoryDelegate;

  DeleteProductFromCartUseCase({required this.repositoryDelegate});

  Future<Either<Errors, GetCartResponseEntity>> invoke(String productId) async {
    return repositoryDelegate.deleteProductFromCart(productId);
  }
}
