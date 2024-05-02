import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/categories_response_entity.dart';
import 'package:e_commerce/domain/entities/errors.dart';
import 'package:e_commerce/domain/repository/repository/home_tab_repository_contract.dart';

class GetAllCategoriesUseCase {
  HomeTabRepositoryContract repositoryDelegate;

  GetAllCategoriesUseCase({required this.repositoryDelegate});

  Future<Either<Errors, CategoriesBrandsResponseEntity>> invoke() {
    return repositoryDelegate.getAllCategories();
  }
}
