import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mody_ecommerce/Ui/utilities/screen_sizes.dart';
import 'package:mody_ecommerce/app/constants/constants.dart';
import 'package:mody_ecommerce/models/product.dart';
import 'package:stacked/stacked.dart';

import '../home_viewModel.dart';

class JacketView extends ViewModelWidget<HomeViewModel> {
  const JacketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return StreamBuilder<List<Product>>(
        stream: viewModel.products,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Product>? products = snapshot.data;

            products!.clear();
            for (var product in viewModel.allProducts!) {
              if (product.category == jacketCategory) {
                products.add(product);
              }
            }

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
                itemCount: products.length,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () =>
                          viewModel.navigateToProductView(products[index]),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                              color: Colors.grey[400] as Color, width: 1),
                          color: Colors.transparent,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: screenHeightPercentage(context,
                                  percentage: 0.27),
                              width: screenWidth(context),
                              child: Image(
                                image: AssetImage(
                                    products[index].productLocation.toString()),
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
