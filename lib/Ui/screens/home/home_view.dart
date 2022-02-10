import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mody_ecommerce/Ui/screens/home/home_viewModel.dart';
import 'package:mody_ecommerce/Ui/utilities/app_colors.dart';
import 'package:mody_ecommerce/Ui/utilities/screen_sizes.dart';
import 'package:mody_ecommerce/models/product.dart';
import 'package:stacked/stacked.dart';

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
      builder: (context, model, _) => Stack(children: [
        DefaultTabController(
          length: 4,
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              fixedColor: backgroundColor,
              currentIndex: model.currentBottomIndex,
              onTap: (value) => model.setBottomIndex(value),
              elevation: 2,
              iconSize: 30,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Person"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Person"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Person"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Person")
              ],
            ),
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
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
            ),
            body: const TabBarView(
              children: [
                JacketView(),
                Text("2"),
                Text("3"),
                Text("4"),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 20, 15, 10),
          child: Container(
            height: screenHeightPercentage(context, percentage: 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                    child: Text(
                  "DISCOVER",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700, fontSize: 25),
                )),
                Icon(Icons.shopping_cart)
              ],
            ),
          ),
        )
      ]),
    );
  }
}

class JacketView extends ViewModelWidget<HomeViewModel> {
  const JacketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return StreamBuilder<List<Product>>(
        stream: viewModel.products,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final products = snapshot.data;
            return GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.63,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 8),
                padding: EdgeInsets.symmetric(
                    horizontal:
                        screenWidthPercentage(context, percentage: 0.03),
                    vertical:
                        screenHeightPercentage(context, percentage: 0.03)),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                            color: Colors.grey[400] as Color, width: 1),
                        color: Colors.transparent,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: screenHeightPercentage(context,
                                percentage: 0.27),
                            width: screenWidth(context),
                            child: Image(
                              image: AssetImage(
                                  products![index].productLocation.toString()),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, top: 10, right: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  products[index].productName.toString(),
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  "${products[index].productPrice.toString()}\$",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ));
          }

          return const Center(
              child: CircularProgressIndicator(
            color: Colors.pink,
          ));
        });
  }
}
