import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mody_ecommerce/Ui/utilities/app_colors.dart';
import 'package:mody_ecommerce/Ui/utilities/screen_sizes.dart';
import 'package:mody_ecommerce/models/product.dart';
import 'package:stacked/stacked.dart';

import '../product_details_viewModel.dart';

class ProductDetailsBottomSheet
    extends ViewModelWidget<ProductDetailsViewModel> {
  final Product? product;
  final ScrollController controller;
  const ProductDetailsBottomSheet(
      {Key? key, this.product, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context, ProductDetailsViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Colors.white),
      child: SingleChildScrollView(
          controller: controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 5,
                  width: screenWidthPercentage(context, percentage: 0.15),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              verticalSpaceMedium,
              Text(
                product!.productName.toString(),
                style: GoogleFonts.poppins(
                    fontSize: 26, fontWeight: FontWeight.w800),
              ),
              Text(
                product!.productDescription.toString(),
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              Text(
                "${product!.productPrice.toString()}\$",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              verticalSpaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => viewModel.add(),
                    child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.grey[300], shape: BoxShape.circle),
                        child: const Center(child: Icon(Icons.add))),
                  ),
                  horizontalSpaceSmall,
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      viewModel.quantity.toString(),
                      style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                  horizontalSpaceSmall,
                  GestureDetector(
                    onTap: () => viewModel.subtract(),
                    child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.grey[300], shape: BoxShape.circle),
                        child: const Center(child: Icon(Icons.remove))),
                  ),
                ],
              ),
              verticalSpaceTiny,
              SizedBox(
                width: screenWidth(context),
                child: TextButton(
                  onPressed: () {
                    viewModel.addToCart(
                        product: product, quantity: viewModel.quantity);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text(
                          "Add to cart",
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(10.0),
                    primary: Colors.black,
                    backgroundColor: backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
