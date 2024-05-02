import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/add_to_cart_response_entity.dart';
import 'package:e_commerce/domain/entities/errors.dart';
import 'package:e_commerce/domain/entities/products_response_entity.dart';
import 'package:e_commerce/domain/repository/data_sources/products_tab_remote_data_source_contract.dart';
import 'package:e_commerce/domain/repository/repository/products_tab_repository_contract.dart';

class ProductsTabRepositoryImpl implements ProductsTabRepositoryContract {
  ProductsTabRemoteDataSourceContract remoteDataSourceDelegate;

  ProductsTabRepositoryImpl({required this.remoteDataSourceDelegate});

  @override
  Future<Either<Errors, ProductsResponseEntity>> getAllProducts() {
    return remoteDataSourceDelegate.getAllProducts();
  }

  @override
  Future<Either<Errors, AddToCartResponseEntity>> addToCart(String? productId) {
    return remoteDataSourceDelegate.addToCart(productId);
  }
}
