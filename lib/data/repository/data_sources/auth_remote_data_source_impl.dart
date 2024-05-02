import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/domain/entities/errors.dart';
import 'package:e_commerce/domain/entities/register_response_entity.dart';
import 'package:e_commerce/domain/repository/data_sources/auth_remote_data_source_contract.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSourceContract {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Errors, RegisterResponseEntitiy>> register(
    String? userName,
    String? userPhoneNumber,
    String? userEmail,
    String? uesrPassword,
  ) async {
    var either = await apiManager.register(
        userName, userEmail, uesrPassword, uesrPassword, userPhoneNumber);
    return either.fold(
        // Either Error :
        (error) {
      return Left(error);
      // Either Success
    }, (response) {
      // to convert the [response] type from `DTO Model` to `Entity Model` to confirm with the return of the [register] method
      return Right(response.toRegisterResponseEntity());
    });
  }

  @override
  Future<Either<Errors, RegisterResponseEntitiy>> login(
      String? userEmail, String? uesrPassword) async {
    var either = await apiManager.login(userEmail, uesrPassword);
    return either.fold(
        // Either Error :
        (error) {
      return Left(error);
      // Either Success
    }, (response) {
      // to convert the [response] type from `DTO Model` to `Entity Model` to confirm with the return of the [register] method
      return Right(response.toRegisterResponseEntity());
    });
  }
}
