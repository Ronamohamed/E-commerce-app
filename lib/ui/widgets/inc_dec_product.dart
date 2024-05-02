import 'package:e_commerce/ui/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncDecProduct extends StatelessWidget {
  final String? quantity;
  const IncDecProduct({super.key, this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: MyColors.blueColor,
          borderRadius: BorderRadius.all(Radius.circular(50.r))),
      child: Row(
        children: [
          IconButton(
            iconSize: 30.sp,
            color: MyColors.whiteColor,
            onPressed: () {},
            icon: Icon(Icons.add_circle_outline_sharp),
          ),
          Text(quantity ?? ' '),
          IconButton(
            iconSize: 30.sp,
            color: MyColors.whiteColor,
            onPressed: () {},
            icon: Icon(Icons.remove_circle_outline),
          ),
        ],
      ),
    );
  }
}
