import 'package:e_commerce/domain/dep_injections.dart';
import 'package:e_commerce/ui/screens/cart/cubit/cart_screen_states.dart';
import 'package:e_commerce/ui/screens/cart/cubit/cart_screen_viewmodel.dart';
import 'package:e_commerce/ui/utils/my_colors.dart';
import 'package:e_commerce/ui/widgets/inc_dec_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = 'cart_screen';

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _viewModel = CartScreenViewModel(
      getCartProductsUseCase: injectGetCartProductsUseCase(),
      deleteProductFromCartUseCase: injectDeleteProductFromCartUseCase(),
      updateProductCountInCartUseCase: injectUpdateProductCountInCartUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartScreenViewModel, CartScreenStates>(
        bloc: _viewModel..getCartProducts(),
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Cart"),
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
                      onPressed: () {},
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
              body: (state is GetCartSuccessState)
                  ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: _viewModel.cartProducts.length,
                              itemBuilder: (context, i) {
                                return Container(
                                  height: 152.h,
                                  margin: EdgeInsets.symmetric(vertical: 15.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    border: Border.all(
                                      color:
                                          MyColors.blueColor.withOpacity(0.3),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.r),
                                            border: Border.all(
                                              color: MyColors.blueColor
                                                  .withOpacity(0.3),
                                            ),
                                          ),
                                          child: Image.network(
                                            _viewModel.cartProducts[i].product
                                                    ?.imageCover ??
                                                '',
                                            height: 152.h,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 8.w,
                                              bottom: 2.h,
                                              right: 8.w),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: 190.w,
                                                    child: Text(
                                                      _viewModel.cartProducts[i]
                                                              .product?.title ??
                                                          '',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium
                                                          ?.copyWith(
                                                              color: MyColors
                                                                  .blueColor),
                                                    ),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        /// TODO: Delete Item from Cart
                                                        _viewModel
                                                            .deleteProductFromCart(
                                                                _viewModel
                                                                        .cartProducts[
                                                                            i]
                                                                        .product
                                                                        ?.id ??
                                                                    "");
                                                      },
                                                      icon: const ImageIcon(
                                                        AssetImage(
                                                            'assets/images/delete_icon.png'),
                                                        color:
                                                            MyColors.blueColor,
                                                      ))
                                                ],
                                              ),
                                              Text(
                                                _viewModel.cartProducts[i]
                                                        .product?.brand?.name ??
                                                    '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium
                                                    ?.copyWith(
                                                        color: MyColors
                                                            .blueColor
                                                            .withOpacity(0.4)),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '${_viewModel.cartProducts[i].price} LE',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium
                                                        ?.copyWith(
                                                            color: MyColors
                                                                .blueColor),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color:
                                                            MyColors.blueColor,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    50.r))),
                                                    child: Row(
                                                      children: [
                                                        IconButton(
                                                          iconSize: 30.sp,
                                                          color: MyColors
                                                              .whiteColor,
                                                          onPressed: () {
                                                            int counter = _viewModel
                                                                    .cartProducts[
                                                                        i]
                                                                    .count
                                                                    ?.toInt() ??
                                                                0;

                                                            0;
                                                            counter++;
                                                            _viewModel.updateProductCountInCart(
                                                                _viewModel
                                                                        .cartProducts[
                                                                            i]
                                                                        .product
                                                                        ?.id ??
                                                                    '',
                                                                counter);
                                                          },
                                                          icon: const Icon(Icons
                                                              .add_circle_outline_sharp),
                                                        ),
                                                        Text(_viewModel
                                                            .cartProducts[i]
                                                            .count
                                                            .toString()),
                                                        IconButton(
                                                          iconSize: 30.sp,
                                                          color: MyColors
                                                              .whiteColor,
                                                          onPressed: () {
                                                            int counter = _viewModel
                                                                    .cartProducts[
                                                                        i]
                                                                    .count
                                                                    ?.toInt() ??
                                                                0;

                                                            counter--;
                                                            if (counter <= 0) {
                                                              counter = 0;
                                                            }
                                                            _viewModel.updateProductCountInCart(
                                                                _viewModel
                                                                        .cartProducts[
                                                                            i]
                                                                        .product
                                                                        ?.id ??
                                                                    '',
                                                                counter);
                                                          },
                                                          icon: const Icon(Icons
                                                              .remove_circle_outline),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Total Price",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                            color: MyColors.blueColor
                                                .withOpacity(0.65),
                                            fontSize: 20.sp),
                                  ),
                                  Text(
                                    state.getCartResponseEntity.data
                                            ?.totalCartPrice
                                            .toString() ??
                                        '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                            color: MyColors.blueColor,
                                            fontSize: 20.sp),
                                  ),
                                ],
                              ),
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.arrow_forward_rounded),
                                label: Text(
                                  "Check Out",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                style: ButtonStyle(
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.symmetric(
                                          horizontal: 50.w, vertical: 15.h)),
                                  foregroundColor:
                                      const MaterialStatePropertyAll(
                                          MyColors.whiteColor),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                    MyColors.blueColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 50.h,
                          )
                        ],
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: MyColors.blueColor,
                      ),
                    ));
        });
  }
}
