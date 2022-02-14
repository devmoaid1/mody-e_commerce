import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mody_ecommerce/Ui/screens/product_details/product_details_viewModel.dart';
import 'package:mody_ecommerce/Ui/utilities/app_colors.dart';
import 'package:mody_ecommerce/Ui/utilities/screen_sizes.dart';
import 'package:mody_ecommerce/models/product.dart';
import 'package:stacked/stacked.dart';

class CartItemCard extends ViewModelWidget<ProductDetailsViewModel> {
  final Product product;
  const CartItemCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context, ProductDetailsViewModel viewModel) {
    return Dismissible(
      key: ObjectKey(product),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20.0),
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction) {
        viewModel.deleteCartItem(product: product);
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
          height: screenHeightPercentage(context, percentage: 0.15),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: screenHeightPercentage(context, percentage: 0.15) / 2,
                backgroundImage: AssetImage(product.productLocation.toString()),
              ),
              horizontalSpaceSmall,
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.productName.toString(),
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${product.productPrice} \$",
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[400]),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () =>
                                viewModel.editProduct(product: product),
                            child: Text(
                              "Edit ",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: backgroundColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "${product.productQuantity} ",
                      textAlign: TextAlign.right,
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
