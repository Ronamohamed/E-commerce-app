import 'package:e_commerce/domain/entities/register_response_entity.dart';

abstract class RegisterScreenStates {}

class InitialState extends RegisterScreenStates {}

class LoadingState extends RegisterScreenStates {}

class ErrorState extends RegisterScreenStates {
  String? errorMessage;

  ErrorState({this.errorMessage});
}

class SuccessState extends RegisterScreenStates {
  RegisterResponseEntitiy? registerResponseEntitiy;

  SuccessState({this.registerResponseEntitiy});
}
