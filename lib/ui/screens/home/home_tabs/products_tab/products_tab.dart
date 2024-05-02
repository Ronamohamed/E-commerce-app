import 'package:e_commerce/domain/dep_injections.dart';
import 'package:e_commerce/ui/screens/home/home_tabs/products_tab/cubit/products_tab_states.dart';
import 'package:e_commerce/ui/screens/home/home_tabs/products_tab/cubit/products_tab_viewmodel.dart';
import 'package:e_commerce/ui/screens/product_details/product_details_screen.dart';
import 'package:e_commerce/ui/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsTab extends StatefulWidget {
  const ProductsTab({super.key});

  @override
  State<ProductsTab> createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
  final _viewModel = ProductsTabViewModel(
      getAllProductsUseCase: injectGetAllProductsUseCase(),
      addToCartUseCase: injectAddToCartUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _viewModel..getAllProducts(),
      child: BlocBuilder<ProductsTabViewModel, ProductsTabStates>(
          builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 10.w,
              childAspectRatio: 1 / 1.3,
            ),
            itemCount: _viewModel.products.length,
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, ProductDetailsScreen.routeName,
                      arguments: _viewModel.products[i]);
                },
                child: Material(
                  borderRadius: BorderRadius.circular(15.r),
                  elevation: 1.5.r,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(
                        width: 2.w,
                        color: MyColors.blueColor.withOpacity(0.3),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.r),
                                  topRight: Radius.circular(15.r),
                                ),
                                child: (state is ProductsTabLoadingState)
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          color: MyColors.blueColor,
                                        ),
                                      )
                                    : Image.network(
                                        _viewModel.products[i].imageCover ?? "",
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                _viewModel.products[i].title ?? "",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color: MyColors.blueColor,
                                      fontSize: 14.sp,
                                    ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${_viewModel.products[i].price} LE",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: MyColors.blueColor,
                                          fontSize: 14.sp,
                                        ),
                                  ),
                                  SizedBox(
                                    width: 45.w,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Review (${_viewModel.products[i].ratingsAverage}) ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: MyColors.blueColor,
                                          fontSize: 14.sp,
                                        ),
                                  ),
                                  const Image(
                                    image: AssetImage(
                                      "assets/images/stat_icon.png",
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      ProductsTabViewModel.get(context)
                                          .addToCart(
                                              _viewModel.products[i].id ?? "");
                                    },
                                    icon: ImageIcon(
                                      size: 30.sp,
                                      const AssetImage(
                                        "assets/images/add_icon.png",
                                      ),
                                      color: MyColors.blueColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
