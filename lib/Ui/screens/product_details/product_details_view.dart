import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mody_ecommerce/Ui/screens/product_details/product_details_viewModel.dart';
import 'package:mody_ecommerce/Ui/utilities/app_colors.dart';
import 'package:mody_ecommerce/Ui/utilities/screen_sizes.dart';
import 'package:mody_ecommerce/app/constants/constants.dart';

import 'package:mody_ecommerce/models/product.dart';
import 'package:stacked/stacked.dart';

class ProductDetailsView extends StatelessWidget {
  final Product? product;
  const ProductDetailsView({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ViewModelBuilder<ProductDetailsViewModel>.reactive(
          viewModelBuilder: () => productDetailsViewModel,
          disposeViewModel: false,
          builder: (context, model, _) => Stack(
            fit: StackFit.expand,
            children: [
              Stack(
                children: [
                  Container(
                      height: screenHeight(context),
                      child: Image(
                        image: AssetImage(product!.productLocation.toString()),
                        fit: BoxFit.fill,
                      )),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    height: screenHeightPercentage(context, percentage: 0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Icon(Icons.arrow_back_ios),
                          onTap: () {
                            model.resetQuantity();
                            Navigator.pop(context);
                          },
                        ),
                        GestureDetector(
                            onTap: () => model.navigateToCartScreen(),
                            child: Icon(Icons.shopping_cart))
                      ],
                    ),
                  )
                ],
              ),
              DraggableScrollableSheet(
                expand: true,
                initialChildSize: 0.6,
                maxChildSize: 0.65,
                minChildSize: 0.55,
                builder: (context, controller) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: Colors.white),
                  child: SingleChildScrollView(
                      controller: controller,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              height: 5,
                              width: screenWidthPercentage(context,
                                  percentage: 0.15),
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
                                onTap: () => model.add(),
                                child: Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        shape: BoxShape.circle),
                                    child:
                                        const Center(child: Icon(Icons.add))),
                              ),
                              horizontalSpaceSmall,
                              Text(
                                model.quantity.toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 60,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              horizontalSpaceSmall,
                              GestureDetector(
                                onTap: () => model.subtract(),
                                child: Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        shape: BoxShape.circle),
                                    child: const Center(
                                        child: Icon(Icons.remove))),
                              ),
                            ],
                          ),
                          verticalSpaceTiny,
                          Container(
                            width: screenWidth(context),
                            child: TextButton(
                              onPressed: () {
                                model.addToCart(
                                    product: product, quantity: model.quantity);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.shopping_cart,
                                    color: Colors.white,
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(8, 0, 0, 0),
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
