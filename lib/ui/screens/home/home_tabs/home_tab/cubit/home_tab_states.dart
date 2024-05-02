import 'package:e_commerce/domain/entities/categories_response_entity.dart';
import 'package:e_commerce/domain/entities/errors.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class CategoryLoadingState extends HomeTabStates {}

class CatagoryErrorState extends HomeTabStates {
  Errors? errorMessage;

  CatagoryErrorState({required this.errorMessage});
}

class CategorySuccessState extends HomeTabStates {
  CategoriesBrandsResponseEntity category;

  CategorySuccessState({required this.category});
}

class BrandsLoadingState extends HomeTabStates {}

class BrandsErrorState extends HomeTabStates {
  Errors? errorMessage;

  BrandsErrorState({required this.errorMessage});
}

class BrandsSuccessState extends HomeTabStates {
  CategoriesBrandsResponseEntity brand;

  BrandsSuccessState({required this.brand});
}
