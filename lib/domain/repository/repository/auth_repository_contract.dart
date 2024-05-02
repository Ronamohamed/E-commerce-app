import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/errors.dart';
import 'package:e_commerce/domain/entities/register_response_entity.dart';

abstract class AuthRepositoryContract {
  Future<Either<Errors, RegisterResponseEntitiy>> register(
    String? userName,
    String? userPhoneNumber,
    String? userEmail,
    String? uesrPassword,
  );
  Future<Either<Errors, RegisterResponseEntitiy>> login(
      String? userEmail, String? uesrPassword);
}
