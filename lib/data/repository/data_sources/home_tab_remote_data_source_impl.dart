import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/domain/entities/categories_response_entity.dart';
import 'package:e_commerce/domain/entities/errors.dart';
import 'package:e_commerce/domain/repository/data_sources/home_tab_remote_data_source_contract.dart';

class HomeTabRemoteDataSourceImpl implements HomeTabRemoteDataSourceContract {
  ApiManager apiManager;

  HomeTabRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Errors, CategoriesBrandsResponseEntity>>
      getAllCategories() async {
    var either = await apiManager.getAllCategories();
    return either.fold(
      // Either Error :
      (error) {
        return Left(error);
      },
      // Either Success :
      (response) {
        return Right(response);

        ///
        //* MARK: There is no coverting method her from DTO to Entity; because DTO extends from Entity
        //* and become one of its sub-types `Polymorphism`
      },
    );
  }

  @override
  Future<Either<Errors, CategoriesBrandsResponseEntity>> getAllBrands() async {
    var either = await apiManager.getAllBrands();
    return either.fold(
      (error) {
        return Left(error);
      },
      (response) {
        return Right(response);
      },
    );
  }
}
