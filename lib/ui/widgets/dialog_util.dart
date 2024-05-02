import 'package:e_commerce/ui/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogUtils {
  static void showLoading(BuildContext context, {required String message}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: MyColors.blueColor,
            ),
            SizedBox(
              width: 20.w,
            ),
            Text(
              message,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 17.sp, color: MyColors.blueColor),
            )
          ],
        ),
      ),
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(BuildContext context,
      {required String? title,
      required String content,
      String? posActionName,
      TextStyle? posActionNameStyle,
      Function? posAction,
      String? negActionName,
      Function? negAction,
      TextStyle? negActionNameStyle}) {
    List<Widget> actions = [];

    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call(); // excute the [posAction] if it != null
          },
          child: Text(
            posActionName,
            style: posActionNameStyle,
          )));
      if (negActionName != null) {
        actions.add(TextButton(
            onPressed: () {
              Navigator.pop(context);
              negAction?.call(); // excute the [negAction] if it != null
            },
            child: Text(
              negActionName,
              style: negActionNameStyle,
            )));
      }
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title ?? "",
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontSize: 20.sp, color: MyColors.blueColor),
        ),
        content: Text(
          content,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: actions,
      ),
    );
  }
}
