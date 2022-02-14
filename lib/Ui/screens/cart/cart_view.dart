import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mody_ecommerce/Ui/screens/product_details/product_details_viewModel.dart';
import 'package:mody_ecommerce/Ui/utilities/app_colors.dart';
import 'package:mody_ecommerce/Ui/utilities/screen_sizes.dart';
import 'package:mody_ecommerce/Ui/widgets/custom_text_field.dart';
import 'package:mody_ecommerce/app/constants/constants.dart';
import 'package:mody_ecommerce/models/order.dart';

import 'package:stacked/stacked.dart';

import 'widgets/cart_item_card.dart';

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
        body: ViewModelBuilder<ProductDetailsViewModel>.reactive(
            viewModelBuilder: () => productDetailsViewModel,
            disposeViewModel: false,
            builder: (context, model, _) => const CartList()));
  }
}

class CartList extends ViewModelWidget<ProductDetailsViewModel> {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ProductDetailsViewModel viewModel) {
    if (viewModel.cartItems!.isEmpty) {
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
                  itemCount: viewModel.cartItems!.length,
                  itemBuilder: (context, index) =>
                      CartItemCard(product: viewModel.cartItems![index]))),
          verticalSpaceSmall,
          Container(
            width: screenWidth(context),
            child: TextButton(
              onPressed: () {
                int total = viewModel.calculateTotalPrice(
                    products: viewModel.cartItems);

                String address = "";

                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      insetPadding: const EdgeInsets.all(8),
                      title: Text("Total Order Price : $total \$",
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                      content: CustomFormField(
                          filledColor: Colors.grey[200] as Color,
                          hintColor: Colors.black,
                          textColor: Colors.black,
                          hint: "Enter Address",
                          name: "adress",
                          onChanged: (value) => address = value.toString()),
                      elevation: 1,
                      actions: [
                        GestureDetector(
                            onTap: () {
                              Order order =
                                  Order(address: address, totalPrice: total);

                              viewModel.placeOrder(
                                  order: order, products: viewModel.cartItems);
                            },
                            child: Text(
                              "Confirm",
                              style: GoogleFonts.poppins(
                                  color: backgroundColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    );
                  },
                );
              },
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
