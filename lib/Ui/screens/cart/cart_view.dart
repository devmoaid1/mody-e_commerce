import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mody_ecommerce/Ui/screens/product_details/product_details_viewModel.dart';
import 'package:mody_ecommerce/Ui/utilities/app_colors.dart';
import 'package:mody_ecommerce/Ui/utilities/screen_sizes.dart';
import 'package:mody_ecommerce/app/constants/constants.dart';
import 'package:mody_ecommerce/models/product.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "My Cart",
            style: GoogleFonts.poppins(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
          foregroundColor: Colors.black,
          backgroundColor: Colors.grey[100],
          elevation: 1,
        ),
        body: Provider<List<Product>?>.value(
            value: productDetailsViewModel.cartItems,
            builder: (context, model) => const CartList()));
  }
}

class CartList extends ViewModelWidget<List<Product>?> {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, List<Product>? viewModel) {
    if (viewModel!.isEmpty) {
      return Center(
          child: Text("Your Cart is Empty",
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.bold)));
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: viewModel.length,
                itemBuilder: (context, index) => Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Container(
                        height:
                            screenHeightPercentage(context, percentage: 0.15),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: screenHeightPercentage(context,
                                      percentage: 0.15) /
                                  2,
                              backgroundImage: AssetImage(
                                  viewModel[index].productLocation.toString()),
                            ),
                            horizontalSpaceSmall,
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        viewModel[index].productName.toString(),
                                        style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "${viewModel[index].productPrice} \$",
                                        style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[400]),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "${viewModel[index].productQuantity} ",
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
                    )),
          ),
          verticalSpaceSmall,
          Container(
            width: screenWidth(context),
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Place Order",
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
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
      ),
    );
  }
}
