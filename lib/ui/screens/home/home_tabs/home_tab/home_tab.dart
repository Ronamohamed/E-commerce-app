import 'package:e_commerce/domain/dep_injections.dart';
import 'package:e_commerce/ui/screens/home/home_tabs/home_tab/cubit/home_tab_states.dart';
import 'package:e_commerce/ui/screens/home/home_tabs/home_tab/cubit/home_tab_viewmodel.dart';
import 'package:e_commerce/ui/screens/home/home_tabs/home_tab/widgets/category_brand_section.dart';
import 'package:e_commerce/ui/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final _viewModel = HomeTabViewModel(
      getCategoriesUseCase: injectGetAllCategoriesUseCase(),
      getAllBrandsUseCase: injectGetAllBrandsUseCase());

  // @override
  // void initState() {
  //   super.initState();
  //   _viewModel.getAllCategories();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
      //* This cascade is alternative of calling these methods below in `initState` method
      //* methods called first then [_viewModel] pass to [bloc]
      bloc: _viewModel
        ..getAllCategories()
        ..getAllBrands(),
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ImageSlideshow(
                    autoPlayInterval: 3500,
                    indicatorBottomPadding: 20.h,
                    isLoop: true,
                    indicatorPadding: 5.w,
                    indicatorRadius: 5.r,
                    indicatorColor: MyColors.blueColor,
                    indicatorBackgroundColor: MyColors.whiteColor,
                    children: _viewModel.ads
                        .map((path) => Image.asset(path))
                        .toList()),
                (state is CategoryLoadingState)
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: MyColors.blueColor,
                        ),
                      )
                    : CategoryBrandSection(
                        list: _viewModel.categories,
                        sectionName: "Categories",
                      ),
                SizedBox(
                  height: 20.h,
                ),
                (state is BrandsLoadingState)
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: MyColors.blueColor,
                        ),
                      )
                    : CategoryBrandSection(
                        list: _viewModel.brands,
                        sectionName: "Brands",
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
