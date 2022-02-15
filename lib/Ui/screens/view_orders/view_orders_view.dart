import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mody_ecommerce/Ui/screens/view_orders/view_orders_viewModel.dart';
import 'package:mody_ecommerce/Ui/utilities/app_colors.dart';
import 'package:mody_ecommerce/Ui/utilities/screen_sizes.dart';
import 'package:mody_ecommerce/Ui/widgets/custom_appBar.dart';
import 'package:mody_ecommerce/models/order.dart';
import 'package:stacked/stacked.dart';

class ViewOrdersView extends StatelessWidget {
  const ViewOrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: adminBackgroundColor,
      appBar: modyAppBar(title: "Orders") as PreferredSizeWidget,
      body: ViewModelBuilder<ViewOrdersViewModel>.reactive(
          onModelReady: (model) => model.getAllOrders(),
          viewModelBuilder: () => ViewOrdersViewModel(),
          builder: (context, model, _) => StreamBuilder<List<Order>>(
                stream: model.orders,
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text("There is no orders",
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    );
                  }
                  if (snapshot.hasData) {
                    List<Order> orders = snapshot.data;
                    return ListView.builder(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                      itemCount: orders.length,
                      itemBuilder: (context, index) => Card(
                        color: Colors.grey[800],
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Container(
                          height:
                              screenHeightPercentage(context, percentage: 0.17),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          margin: EdgeInsets.only(top: 8, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: screenHeightPercentage(context,
                                        percentage: 0.12) /
                                    2,
                                backgroundImage: const AssetImage(
                                    "assets/icons/buyIcon.png"),
                              ),
                              horizontalSpaceSmall,
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      " Total Price :${orders[index].totalPrice} \$",
                                      style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Expanded(
                                      child: Text(
                                        " # ${orders[index].orderId!.substring(0, 10)}",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[400]),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        " Address is: ${orders[index].address}aaaaaaaaaaaaaaaa",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[400]),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          model.navigateToOrderDetails(
                                              id: orders[index]
                                                  .orderId
                                                  .toString());
                                        },
                                        child: Text(
                                          "View Details >> ",
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: backgroundColor),
                                        ),
                                      ),
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

                  return const Center(
                    child: CircularProgressIndicator(
                      color: backgroundColor,
                    ),
                  );
                },
              )),
    );
  }
}
