import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:mody_ecommerce/Ui/screens/product_details/product_details_viewModel.dart';
import 'package:mody_ecommerce/Ui/screens/product_details/widgets/product_details_sheet.dart';

import 'package:mody_ecommerce/Ui/utilities/screen_sizes.dart';
import 'package:mody_ecommerce/app/constants/constants.dart';

import 'package:mody_ecommerce/models/product.dart';
import 'package:stacked/stacked.dart';

import '../../../app/constants/assets.dart';

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
                  SizedBox(
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
                          child: const Icon(Icons.arrow_back_ios),
                          onTap: () {
                            model.resetQuantity();
                            Navigator.pop(context);
                          },
                        ),
                        GestureDetector(
                            onTap: () => model.navigateToCartScreen(),
                            child: SvgPicture.asset(
                              Assets.cartIcon,
                              height: 30,
                              color: Colors.grey[700],
                            ))
                      ],
                    ),
                  )
                ],
              ),
              DraggableScrollableSheet(
                  expand: true,
                  initialChildSize: 0.45,
                  maxChildSize: 0.65,
                  minChildSize: 0.45,
                  builder: (context, controller) => ProductDetailsBottomSheet(
                        controller: controller,
                        product: product,
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
