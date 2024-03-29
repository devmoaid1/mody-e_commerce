import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mody_ecommerce/Ui/screens/home/home_viewModel.dart';
import 'package:mody_ecommerce/Ui/screens/home/widgets/category_card.dart';
import 'package:mody_ecommerce/Ui/screens/product_details/product_details_viewModel.dart';
import 'package:mody_ecommerce/Ui/utilities/screen_sizes.dart';
import 'package:mody_ecommerce/app/constants/assets.dart';
import 'package:mody_ecommerce/app/constants/constants.dart';

import 'package:stacked/stacked.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/jacket_view.dart';
import 'widgets/product_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, _) => Scaffold(
          appBar: AppBar(
              leadingWidth: screenWidthPercentage(context, percentage: 0.2),
              leading: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Image.asset(
                  Assets.modyIcon,
                  fit: BoxFit.fill,
                ),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: [
                GestureDetector(
                    onTap: () => model.navigateToCartScreen(),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: ViewModelBuilder<ProductDetailsViewModel>.reactive(
                        viewModelBuilder: () => productDetailsViewModel,
                        builder: (context, model, _) => Badge(
                          badgeColor: model.cartItems!.isNotEmpty
                              ? Colors.red
                              : Colors.transparent,
                          elevation: 0,
                          position: BadgePosition.topEnd(),
                          padding: const EdgeInsets.all(8),
                          badgeContent: model.cartItems!.isNotEmpty
                              ? Container(
                                  child: Center(
                                    child: Text(
                                      model.cartItems!.length.toString(),
                                      style: GoogleFonts.poppins(
                                          color: Colors.white),
                                    ),
                                  ),
                                )
                              : Container(
                                  color: Colors.transparent,
                                ),
                          child: SvgPicture.asset(
                            Assets.cartIcon,
                            height: 30,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: GestureDetector(
                      onTap: () {
                        if (authService.isLoggedIn) {
                          model.logout();
                        } else {
                          model.navigateToLoginScreen();
                        }
                      },
                      child: SvgPicture.asset(
                        authService.isLoggedIn
                            ? Assets.logoutIcon
                            : Assets.loginIcon,
                        color: Colors.grey[700],
                        height: 30,
                      )),
                )
              ]),
          body: Column(
            children: [
              SizedBox(
                height: screenHeightPercentage(context, percentage: 0.05),
                child: ListView.builder(
                    itemCount: model.categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final categoryIndex = model.categories[index].index;
                      final categoryName = model.categories[index].name;

                      return CategoryCard(
                          pageController: pageController,
                          categoryIndex: categoryIndex,
                          name: categoryName);
                    }),
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    model.setTabIndex(index);
                  },
                  children: const [
                    JacketView(),
                    ProductView(
                      category: shoesCategory,
                    ),
                    ProductView(
                      category: tShirtsCategory,
                    ),
                    ProductView(
                      category: trousersCategory,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
