import 'package:e_commerce/domain/entities/add_to_cart_response_entity.dart';
import 'package:e_commerce/domain/entities/errors.dart';
import 'package:e_commerce/domain/entities/products_response_entity.dart';

abstract class ProductsTabStates {}

class ProductsTabInitialState extends ProductsTabStates {}

class ProductsTabLoadingState extends ProductsTabStates {
  String? loadingMessage;

  ProductsTabLoadingState({this.loadingMessage});
}

class ProductsTabErrorState extends ProductsTabStates {
  Errors? error;

  ProductsTabErrorState({required this.error});
}

class ProductsTabSuccesslState extends ProductsTabStates {
  ProductsResponseEntity? productsResponse;

  ProductsTabSuccesslState({required this.productsResponse});
}

class AddToCartLoadingState extends ProductsTabStates {
  String? loadingMessage;

  AddToCartLoadingState({this.loadingMessage});
}

class AddToCartErrorState extends ProductsTabStates {
  Errors? error;

  AddToCartErrorState({required this.error});
}

class AddToCartSuccesslState extends ProductsTabStates {
  AddToCartResponseEntity? addToCartResponseEntity;

  AddToCartSuccesslState({required this.addToCartResponseEntity});
}
