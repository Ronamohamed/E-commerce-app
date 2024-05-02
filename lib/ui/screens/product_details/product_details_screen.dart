import 'package:e_commerce/domain/entities/products_response_entity.dart';
import 'package:e_commerce/ui/screens/cart/cart_screen.dart';
import 'package:e_commerce/ui/utils/my_colors.dart';
import 'package:e_commerce/ui/widgets/inc_dec_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = 'product_details_screen';

  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var productArgs =
        ModalRoute.of(context)?.settings.arguments as ProductEntity;

    return Scaffold(
      appBar: AppBar(
        title: Text(productArgs.title ?? ''),
        actions: [
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              const AssetImage(
                "assets/images/search_icon.png",
              ),
              color: MyColors.blueColor,
              size: 40.sp,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
              icon: const ImageIcon(
                AssetImage(
                  "assets/images/cart_icon.png",
                ),
                color: MyColors.blueColor,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: MyColors.blueColor.withOpacity(0.3)),
                    borderRadius: BorderRadius.all(Radius.circular(15.r))),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15.r)),
                  child: Stack(
                    children: [
                      ImageSlideshow(
                        height: 300.h,
                        autoPlayInterval: 4000,
                        indicatorBottomPadding: 20.h,
                        isLoop: true,
                        indicatorPadding: 5.w,
                        indicatorRadius: 5.r,
                        indicatorColor: MyColors.blueColor,
                        indicatorBackgroundColor: MyColors.whiteColor,
                        children: productArgs.images!
                            .map((path) => Image.network(
                                  path,
                                  fit: BoxFit.cover,
                                  height: 300.h,
                                  width: double.infinity,
                                ))
                            .toList(),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          onPressed: () {},
                          icon: CircleAvatar(
                            backgroundColor: MyColors.whiteColor,
                            radius: 18.r,
                            child: ImageIcon(
                              const AssetImage(
                                "assets/images/favorit_icon.png",
                              ),
                              size: 25.r,
                              color: MyColors.blueColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      maxLines: 2,
                      productArgs.title ?? "",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: MyColors.blueColor, fontSize: 18.sp),
                    ),
                  ),
                  Text(
                    'EGP ${productArgs.price}',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: MyColors.blueColor, fontSize: 18.sp),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 5.h),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: MyColors.blueColor.withOpacity(0.3)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.r))),
                        child: Text(
                          "${productArgs.sold} Sold",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: MyColors.blueColor, fontSize: 15.sp),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Row(
                        children: [
                          const Image(
                            image: AssetImage(
                              "assets/images/stat_icon.png",
                            ),
                          ),
                          Text(
                            " ${productArgs.ratingsAverage} ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: MyColors.blueColor,
                                  fontSize: 16.sp,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IncDecProduct()
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Description",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: MyColors.blueColor, fontSize: 18.sp),
                  )
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: ReadMoreText(
                  trimLength: 300,
                  productArgs.description ?? "",
                  style: TextStyle(
                      color: MyColors.blueColor.withOpacity(0.8),
                      fontSize: 15.sp),
                  textAlign: TextAlign.start,
                  preDataTextStyle: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: MyColors.blueColor, fontSize: 15.sp),
                  postDataTextStyle: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: MyColors.blueColor, fontSize: 15.sp),
                  trimMode: TrimMode.Line,
                  isExpandable: true,
                  trimLines: 3,
                  trimCollapsedText: 'Read more',
                  trimExpandedText: ' Show less',
                  moreStyle: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: MyColors.blueColor, fontSize: 15.sp),
                  lessStyle: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: MyColors.blueColor, fontSize: 15.sp),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Total Price",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: MyColors.blueColor.withOpacity(0.65),
                            fontSize: 18.sp),
                      ),
                      Text(
                        productArgs.price.toString(),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: MyColors.blueColor, fontSize: 18.sp),
                      ),
                    ],
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add_shopping_cart_sharp),
                    label: Text(
                      "Add To Cart",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    style: ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                          horizontal: 50.w, vertical: 15.h)),
                      foregroundColor:
                          const MaterialStatePropertyAll(MyColors.whiteColor),
                      backgroundColor: const MaterialStatePropertyAll(
                        MyColors.blueColor,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
