import 'package:e_commerce/ui/screens/home/cubit/home_screen_viewmodel.dart';
import 'package:e_commerce/ui/screens/home/widgets/home_app_bar.dart';
import 'package:e_commerce/ui/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _viewModel,
      builder: (context, state) {
        return SingleChildScrollView(
          child: Scaffold(
            appBar: (_viewModel.selectedIndex == 3)
                ? null
                : AppBar(
              toolbarHeight: 130.h,
              title: const HomeAppBar(),
            ),
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: MyColors.blueColor,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                  color: MyColors.blueColor, // Set background color here
                ),
                child: BottomNavigationBar(
                  currentIndex: _viewModel.selectedIndex,
                  onTap: (newIndex) {
                    _viewModel.changeTab(newIndex);
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: (_viewModel.selectedIndex == 0)
                          ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: ImageIcon(
                            AssetImage("assets/images/home_icon.png")),
                      )
                          : const ImageIcon(
                        AssetImage("assets/images/home_icon.png"),
                      ),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: (_viewModel.selectedIndex == 1)
                          ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: ImageIcon(
                            AssetImage("assets/images/category_icon.png")),
                      )
                          : const ImageIcon(
                        AssetImage("assets/images/category_icon.png"),
                      ),
                      label: "Categories",
                    ),
                    BottomNavigationBarItem(
                      icon: (_viewModel.selectedIndex == 2)
                          ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: ImageIcon(
                            AssetImage("assets/images/favorit_icon.png")),
                      )
                          : const ImageIcon(
                        AssetImage("assets/images/favorit_icon.png"),
                      ),
                      label: "Favorites",
                    ),
                    BottomNavigationBarItem(
                      icon: (_viewModel.selectedIndex == 3)
                          ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: ImageIcon(
                            AssetImage("assets/images/profile_icon.png")),
                      )
                          : const ImageIcon(
                        AssetImage("assets/images/profile_icon.png"),
                      ),
                      label: "Profile",
                    ),
                  ],
                ),
              ),
            ),
            body: _viewModel.tabs[_viewModel.selectedIndex],
          ),
        );
      },
    );
  }
}
