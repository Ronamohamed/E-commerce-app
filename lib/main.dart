// ignore_for_file: must_be_immutable

import 'package:e_commerce/data/api/api_constants.dart';
import 'package:e_commerce/ui/screens/auth/login/login_screen.dart';
import 'package:e_commerce/ui/screens/home/home_screen.dart';
import 'package:e_commerce/ui/utils/my_routes.dart';
import 'package:e_commerce/ui/utils/my_shared_preferences.dart';
import 'package:e_commerce/ui/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPreferces.init();
  var userToken = MySharedPreferces.getData(key: ApiConstants.userToken);
  String appRoute;
  if (userToken == null) {
    appRoute = LoginScreen.routeName;
  } else {
    appRoute = HomeScreen.routeName;
  }
  runApp(ECommerceApp(appRoute: appRoute));
}

class ECommerceApp extends StatelessWidget {
  String? appRoute;

  ECommerceApp({required this.appRoute, super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme.myTheme,
        initialRoute: appRoute,
        routes: MyRoutes.myRoutes,
      ),
    );
  }
}
