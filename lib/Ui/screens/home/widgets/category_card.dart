import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mody_ecommerce/Ui/screens/home/home_viewModel.dart';
import 'package:stacked/stacked.dart';

import '../../../utilities/app_colors.dart';
import '../../../utilities/screen_sizes.dart';

class CategoryCard extends ViewModelWidget<HomeViewModel> {
  final String name;
  final PageController pageController;

  final int categoryIndex;
  const CategoryCard(
      {Key? key,
      required this.categoryIndex,
      required this.name,
      required this.pageController})
      : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return GestureDetector(
      onTap: () => pageController.jumpToPage(categoryIndex),
      child: Container(
        width: screenWidthPercentage(context, percentage: 0.25),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 2,
                    color: viewModel.currentTabIndex == categoryIndex
                        ? backgroundColor
                        : Colors.transparent))),
        child: Center(
          child: Text(
            name,
            style: GoogleFonts.poppins(
                fontSize: screenWidthPercentage(context, percentage: 0.04),
                color: viewModel.currentTabIndex == categoryIndex
                    ? Colors.black
                    : Colors.black.withOpacity(0.3),
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
