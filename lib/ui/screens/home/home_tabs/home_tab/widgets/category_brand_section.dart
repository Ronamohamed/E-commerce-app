import 'package:e_commerce/domain/entities/categories_response_entity.dart';
import 'package:e_commerce/ui/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryBrandSection extends StatelessWidget {
  final List<CategoryBrandEntity> list;
  final String? sectionName;
  const CategoryBrandSection({super.key, required this.list, this.sectionName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionName ?? "",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: MyColors.blueColor),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "view all",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: MyColors.blueColor, fontSize: 15.sp),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 0.70,
                  mainAxisSpacing: 5.w,
                  crossAxisSpacing: 40.h,
                  crossAxisCount: 2,
                ),
                itemCount: list.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      (list.isEmpty)
                          ? const CircularProgressIndicator(
                              color: MyColors.blueColor,
                            )
                          : CircleAvatar(
                              radius: 50.r,
                              foregroundImage: NetworkImage(
                                list[i].image ?? "",
                              ),
                            ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        list[i].name ?? "",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: MyColors.blueColor, fontSize: 15.sp),
                      )
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
