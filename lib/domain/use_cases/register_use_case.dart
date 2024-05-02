import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/errors.dart';
import 'package:e_commerce/domain/entities/register_response_entity.dart';
import 'package:e_commerce/domain/repository/repository/auth_repository_contract.dart';

class RegisterUseCase {
  AuthRepositoryContract authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<Errors, RegisterResponseEntitiy>> invoke(String? userName,
      String? userPhoneNumber, String? userEmail, String? uesrPassword) {
    return authRepository.register(
        userName, userPhoneNumber, userEmail, uesrPassword);
  }
}
