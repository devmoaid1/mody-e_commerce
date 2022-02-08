import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mody_ecommerce/Ui/utilities/app_colors.dart';
import 'package:mody_ecommerce/Ui/utilities/screen_sizes.dart';
import 'package:mody_ecommerce/Ui/widgets/custom_appBar.dart';
import 'package:mody_ecommerce/models/product.dart';
import 'package:stacked/stacked.dart';

import 'manage_product_viewModel.dart';

class ManageProductView extends StatelessWidget {
  const ManageProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: adminBackgroundColor,
        appBar:
            modyAppBar(title: "Manage Products", foregroundColor: Colors.white)
                as PreferredSizeWidget,
        body: ViewModelBuilder<ManageProductViewModel>.reactive(
            onModelReady: (model) => model.getAllProducts(),
            viewModelBuilder: () => ManageProductViewModel(),
            builder: (context, model, _) {
              return StreamBuilder<List<Product>>(
                  stream: model.products,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final products = snapshot.data;
                      return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.63,
                                  crossAxisSpacing: 4,
                                  mainAxisSpacing: 8),
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidthPercentage(context,
                                  percentage: 0.03),
                              vertical: screenHeightPercentage(context,
                                  percentage: 0.03)),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) => GestureDetector(
                                onTapUp: (details) {
                                  double dx = details.globalPosition.dx;
                                  double dy = details.globalPosition.dy;
                                  double bottom = screenHeight(context) - dy;
                                  double right = screenWidth(context) - dx;

                                  showMenu(
                                      color: Colors.grey[700],
                                      context: context,
                                      position: RelativeRect.fromLTRB(
                                          dx, dy, right, bottom),
                                      items: [
                                        PopupMenuItem(
                                            onTap: () => model.deleteProduct(
                                                id: products![index].productId),
                                            child: Text(
                                              "Delete",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white),
                                            ))
                                      ]);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        color: Colors.grey[300] as Color,
                                        width: 1),
                                    color: Colors.transparent,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: screenHeightPercentage(context,
                                            percentage: 0.27),
                                        width: screenWidth(context),
                                        child: Image(
                                          image: AssetImage(products![index]
                                              .productLocation
                                              .toString()),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, top: 10, right: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 6,
                                                  child: Text(
                                                    products[index]
                                                        .productName
                                                        .toString(),
                                                    style: GoogleFonts.raleway(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: GestureDetector(
                                                    onTap: () => model
                                                        .navigateToEditProduct(
                                                            product: products[
                                                                index]),
                                                    child: const Icon(
                                                      Icons.settings,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Text(
                                              "${products[index].productPrice.toString()}\$",
                                              style: GoogleFonts.raleway(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                    }

                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.pink,
                    ));
                  });
            }));
  }
}
