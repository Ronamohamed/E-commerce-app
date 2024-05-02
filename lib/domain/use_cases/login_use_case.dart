import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/errors.dart';
import 'package:e_commerce/domain/entities/register_response_entity.dart';
import 'package:e_commerce/domain/repository/repository/auth_repository_contract.dart';

class LoginUseCase {
  AuthRepositoryContract authRepositoryDelegate;

  LoginUseCase({required this.authRepositoryDelegate});

  Future<Either<Errors, RegisterResponseEntitiy>> invoke(
      String? userEmail, String? uesrPassword) {
    return authRepositoryDelegate.login(userEmail, uesrPassword);
  }
}
