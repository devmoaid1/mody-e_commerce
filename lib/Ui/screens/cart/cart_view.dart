import 'package:flutter/material.dart';
import 'package:mody_ecommerce/Ui/screens/product_details/product_details_viewModel.dart';
import 'package:mody_ecommerce/app/constants/constants.dart';
import 'package:stacked/stacked.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ViewModelBuilder<ProductDetailsViewModel>.reactive(
        viewModelBuilder: () => productDetailsViewModel,
        disposeViewModel: false,
        builder: (context, model, _) => ListView(
          children: [
            Text(model.cartItems![0].productQuantity.toString()),
            Text(model.cartItems![1].productQuantity.toString()),
            Text(model.cartItems![2].productQuantity.toString()),
            Text(model.cartItems![3].productQuantity.toString()),
            Text(model.cartItems![0].productQuantity.toString()),
            Text(model.cartItems![4].productQuantity.toString())
          ],
        ),
      ),
    );
  }
}
