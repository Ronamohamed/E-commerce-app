// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce/data/api/api_constants.dart';
import 'package:e_commerce/ui/screens/auth/login/login_screen.dart';
import 'package:e_commerce/ui/utils/my_colors.dart';
import 'package:e_commerce/ui/utils/my_shared_preferences.dart';
import 'package:e_commerce/ui/widgets/dialog_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/app_bar_logo.png'),
                IconButton(
                    onPressed: () {
                      DialogUtils.showMessage(
                        context,
                        title: "Sign Out",
                        content: "Do you really want to sign out?",
                        negActionName: "Yes",
                        negAction: () async {
                          DialogUtils.showLoading(context,
                              message: "Loading...");
                          MySharedPreferces.deleteData(
                              key: ApiConstants.userToken);
                          await Future.delayed(Durations.long2);
                          DialogUtils.hideLoading(context);
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            LoginScreen.routeName,
                            (Route<dynamic> route) => false,
                          );
                        },
                        posActionName: "Cancel",
                        posAction: () {},
                      );
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: MyColors.blueColor,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
