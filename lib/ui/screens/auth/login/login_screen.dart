import 'package:e_commerce/domain/dep_injections.dart';
import 'package:e_commerce/ui/screens/auth/login/cubit/login_screen_view_model.dart';
import 'package:e_commerce/ui/screens/auth/register/cubit/register_screen_states.dart';
import 'package:e_commerce/ui/screens/auth/register/register_screen.dart';
import 'package:e_commerce/ui/screens/home/home_screen.dart';
import 'package:e_commerce/ui/utils/my_colors.dart';
import 'package:e_commerce/ui/widgets/auth_button.dart';
import 'package:e_commerce/ui/widgets/auth_textform_field.dart';
import 'package:e_commerce/ui/widgets/dialog_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login_screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _viewModel = LoginScreenViewModel(loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _viewModel,
      listener: (context, state) {
        if (state is LoadingState) {
          DialogUtils.showLoading(context, message: "Loading...");
        } else if (state is ErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context,
              title: "Error", content: state.errorMessage ?? "");
        } else if (state is SuccessState) {
          DialogUtils.hideLoading(context);
          // DialogUtils.showMessage(context,
          //     title: "Login Successeded",
          //     content: state.registerResponseEntitiy?.user?.name ?? "");
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        }
      },
      child: Scaffold(
        backgroundColor: MyColors.blueColor,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Form(
              key: _viewModel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: 95.h, right: 96.h, left: 96.h),
                    child: Image.asset('assets/images/app_logo.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50.h, bottom: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back To Route",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontSize: 24),
                        ),
                        Text(
                          "Please sign in with your mail",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: MyColors.whiteColor),
                        )
                      ],
                    ),
                  ),
                  AuthTextFormField(
                    controller: _viewModel.userEmailController,
                    fieldTitle: "E-mail",
                    hintText: "enter your email address",
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: AuthTextFormField(
                      controller: _viewModel.uesrPasswordController,
                      fieldTitle: "Password",
                      hintText: "enter your password",
                      obscureText: _viewModel.isPasswordSecured,
                      suffixIcon: IconButton(
                          icon: (_viewModel.isPasswordSecured)
                              ? const ImageIcon(AssetImage(
                                  'assets/images/eye_slash_icon.png'))
                              : const ImageIcon(
                                  AssetImage('assets/images/eye_icon.png')),
                          onPressed: () {
                            setState(() {
                              _viewModel.isPasswordSecured =
                                  !_viewModel.isPasswordSecured;
                            });
                          }),
                    ),
                  ),
                  InkWell(
                    overlayColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    onTap: () {},
                    child: Text(
                      "Forget Password",
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50.h, bottom: 30.h),
                    child: AuthButton(
                        title: "Login",
                        onPressed: () {
                          _viewModel.login();
                        }),
                  ),
                  InkWell(
                    overlayColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    onTap: () {
                      Navigator.pushNamed(context, RegisterScreen.routeName);
                    },
                    child: Text(
                      "Don't have an account? Create Account",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
