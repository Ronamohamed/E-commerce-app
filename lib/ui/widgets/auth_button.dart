import 'package:e_commerce/ui/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const AuthButton({required this.title, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13.r)),
            foregroundColor: MyColors.blueColor,
            backgroundColor: MyColors.whiteColor,
            textStyle: Theme.of(context).textTheme.titleMedium),
        onPressed: onPressed,
        child: Text(title));
  }
}
