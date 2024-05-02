import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/domain/entities/errors.dart';
import 'package:e_commerce/domain/entities/get_cart_response_entity.dart';
import 'package:e_commerce/domain/repository/data_sources/cart_remote_data_source_contract.dart';

class CartRemoteDataSourceImpl implements CartRemoteDataSourceContract {
  ApiManager apiManager;
  CartRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Errors, GetCartResponseEntity>> getCartProducts() async {
    var either = await apiManager.getCartProducts();
    return either.fold(
      (error) {
        return Left(error);
      },
      (response) {
        return Right(response);
      },
    );
  }

  @override
  Future<Either<Errors, GetCartResponseEntity>> deleteProductFromCart(
      String productId) async {
    var either = await apiManager.deleteProductFromCart(productId);
    return either.fold(
      (error) {
        return Left(error);
      },
      (response) {
        return Right(response);
      },
    );
  }

  @override
  Future<Either<Errors, GetCartResponseEntity>> updateProductCountInCart(
      String productId, int count) async {
    var either = await apiManager.updateProductCountInCart(productId, count);
    return either.fold((error) {
      return Left(error);
    }, (response) {
      return Right(response);
    });
  }
}
