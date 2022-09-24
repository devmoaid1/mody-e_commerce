import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mody_ecommerce/Ui/screens/home/home_viewModel.dart';
import 'package:mody_ecommerce/Ui/utilities/app_colors.dart';
import 'package:mody_ecommerce/Ui/utilities/screen_sizes.dart';
import 'package:mody_ecommerce/app/constants/assets.dart';
import 'package:mody_ecommerce/app/constants/constants.dart';


import 'package:stacked/stacked.dart';

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
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, _) => DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
              leadingWidth: screenWidthPercentage(context, percentage: 0.2),
              leading: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Image.asset(
                  Assets.modyIcon,
                  fit: BoxFit.fill,
                ),
              ),
              actionsIconTheme: const IconThemeData(color: Colors.black),
              elevation: 0,
              backgroundColor: Colors.transparent,
              bottom: TabBar(
                indicatorColor: backgroundColor,
                onTap: (value) => model.setTabIndex(value),
                tabs: [
                  Tab(
                    child: Text(
                      "Jackets",
                      style: GoogleFonts.poppins(
                          fontSize: model.currentTabIndex == 0 ? 15 : null,
                          color: model.currentTabIndex == 0
                              ? Colors.black
                              : Colors.black.withOpacity(0.3),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Shoes",
                      style: GoogleFonts.poppins(
                          fontSize: model.currentTabIndex == 1 ? 16 : null,
                          color: model.currentTabIndex == 1
                              ? Colors.black
                              : Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "T-Shirts",
                      style: GoogleFonts.poppins(
                          fontSize: model.currentTabIndex == 2 ? 15 : null,
                          color: model.currentTabIndex == 2
                              ? Colors.black
                              : Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Trousers",
                      style: GoogleFonts.poppins(
                          fontSize: model.currentTabIndex == 3 ? 15 : 15,
                          color: model.currentTabIndex == 3
                              ? Colors.black
                              : Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              actions: [
                GestureDetector(
                    onTap: () => model.navigateToCartScreen(),
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: const  )),
                GestureDetector(
                    onTap: () => model.logout(),
                    child: const SvgPicture.asset(Assets.logoutIcon))
              ]),
          body: const TabBarView(
            children: [
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
      ),
    );
  }
}
