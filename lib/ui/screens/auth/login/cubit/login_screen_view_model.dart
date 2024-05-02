import 'package:e_commerce/domain/use_cases/login_use_case.dart';
import 'package:e_commerce/ui/screens/auth/register/cubit/register_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenViewModel extends Cubit<RegisterScreenStates> {
  LoginUseCase? loginUseCase;

  LoginScreenViewModel({required this.loginUseCase}) : super(InitialState());

  var userEmailController = TextEditingController(text: "haytham@yahoo.com");
  var uesrPasswordController = TextEditingController(text: "12345678");
  var formKey = GlobalKey<FormState>();
  bool isPasswordSecured = true;

  void login() async {
    emit(LoadingState());
    var either = await loginUseCase?.invoke(
        userEmailController.text, uesrPasswordController.text);
    either?.fold(
      (error) => emit(ErrorState(errorMessage: error.errorMessage)),
      (loginResponse) =>
          emit(SuccessState(registerResponseEntitiy: loginResponse)),
    );
  }
}
