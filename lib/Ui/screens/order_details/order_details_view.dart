import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mody_ecommerce/Ui/screens/cart/widgets/cart_item_card.dart';
import 'package:mody_ecommerce/Ui/screens/order_details/order_details_viewModel.dart';
import 'package:mody_ecommerce/Ui/utilities/app_colors.dart';
import 'package:mody_ecommerce/Ui/utilities/screen_sizes.dart';
import 'package:mody_ecommerce/Ui/widgets/custom_appBar.dart';
import 'package:mody_ecommerce/models/product.dart';
import 'package:stacked/stacked.dart';

class OrderDetailsView extends StatelessWidget {
  final String? docId;
  const OrderDetailsView({Key? key, this.docId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: adminBackgroundColor,
      appBar: modyAppBar(title: " #${docId!.substring(0, 9)}")
          as PreferredSizeWidget,
      body: ViewModelBuilder<OrderDetailsViewModel>.reactive(
          viewModelBuilder: () => OrderDetailsViewModel(),
          onModelReady: (model) => model.loadOrderDetails(docId: docId),
          builder: (context, model, _) => StreamBuilder<List<Product>>(
              stream: model.orderDetails,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<Product> products = snapshot.data;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 11, vertical: 10),
                        child: Text(
                          "Order Details",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          itemCount: products.length,
                          itemBuilder: (context, index) => Card(
                            color: const Color(0xFF424447),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: Container(
                              height: screenHeightPercentage(context,
                                  percentage: 0.15),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: screenHeightPercentage(context,
                                            percentage: 0.15) /
                                        2,
                                    backgroundImage: AssetImage(products[index]
                                        .productLocation
                                        .toString()),
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
                                              products[index]
                                                  .productName
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "${products[index].productPrice} \$",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: backgroundColor),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Qty:",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              "${products[index].productQuantity} ",
                                              textAlign: TextAlign.right,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 11, vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Center(
                                  child: Text("confirm order",
                                      style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800)),
                                ),
                                decoration: BoxDecoration(
                                    gradient: purpleBlue,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                            horizontalSpaceMedium,
                            Expanded(
                              child: Container(
                                width: screenWidthPercentage(context,
                                    percentage: 0.4),
                                padding: const EdgeInsets.all(8),
                                child: Center(
                                  child: Text("Delete Order",
                                      style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800)),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: backgroundColor,
                  ),
                );
              })),
    );
  }
}
