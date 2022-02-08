import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:mody_ecommerce/Ui/screens/add_product/add_product_viewmodel.dart';
import 'package:mody_ecommerce/Ui/utilities/app_colors.dart';
import 'package:mody_ecommerce/Ui/utilities/screen_sizes.dart';
import 'package:mody_ecommerce/Ui/widgets/custom_appBar.dart';
import 'package:mody_ecommerce/Ui/widgets/custom_text_field.dart';
import 'package:mody_ecommerce/app/constants/constants.dart';
import 'package:mody_ecommerce/models/product.dart';
import 'package:stacked/stacked.dart';

import 'edit_product_viewModel.dart';

class EditProductView extends StatelessWidget {
  final Product? product;
  EditProductView({Key? key, this.product}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditProductViewModel>.nonReactive(
      viewModelBuilder: () => EditProductViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: adminBackgroundColor,
        appBar: modyAppBar(title: "Edit Product", foregroundColor: Colors.white)
            as PreferredSizeWidget,
        body: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: ListView(
            children: [
              SizedBox(
                height: screenHeight(context) * 0.06,
              ),
              FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        child: CustomFormField(
                          textColor: Colors.white,
                          hintColor: Colors.white,
                          filledColor: Colors.transparent,
                          hint: "product name",
                          name: "productName",
                          initialValue: product!.productName,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        child: CustomFormField(
                          textColor: Colors.white,
                          hintColor: Colors.white,
                          filledColor: Colors.transparent,
                          hint: "product category",
                          name: "productCategory",
                          initialValue: product!.category,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        child: CustomFormField(
                            textColor: Colors.white,
                            hintColor: Colors.white,
                            filledColor: Colors.transparent,
                            hint: "product description",
                            name: "productDescription",
                            initialValue: product!.productDescription),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        child: CustomFormField(
                          textColor: Colors.white,
                          hintColor: Colors.white,
                          filledColor: Colors.transparent,
                          hint: "product price",
                          name: "productPrice",
                          keyboard: TextInputType.number,
                          initialValue: product!.productPrice.toString(),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        child: CustomFormField(
                          textColor: Colors.white,
                          hintColor: Colors.white,
                          filledColor: Colors.transparent,
                          hint: "product Location",
                          name: "productLocation",
                          initialValue: product!.productLocation,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight(context) * 0.05,
                      ),
                      GestureDetector(
                        onTap: () {
                          _formKey.currentState!.save();
                          if (_formKey.currentState!.validate()) {
                            Product newProduct = Product(
                                productName:
                                    _formKey.currentState!.value['productName'] == null
                                        ? product!.productName
                                        : _formKey
                                            .currentState!.value['productName'],
                                category: _formKey.currentState!.value['category'] == null
                                    ? product!.category
                                    : _formKey.currentState!.value['category'],
                                productDescription:
                                    _formKey.currentState!.value['productDescription'] == null
                                        ? product!.productDescription
                                        : _formKey.currentState!
                                            .value['productDescription'],
                                productLocation:
                                    _formKey.currentState!.value['productLocation'] == null
                                        ? product!.productLocation
                                        : _formKey.currentState!
                                            .value['productLocation'],
                                productPrice: _formKey.currentState!.value['productPrice'] == null
                                    ? product!.productPrice
                                    : double.parse(_formKey.currentState!.value['productPrice'])
                                        .toDouble());

                            logger.i(newProduct.productLocation);
                            model.update(
                                id: product!.productId, product: newProduct);
                          }
                        },
                        child: Container(
                          width: screenHeight(context),
                          padding: const EdgeInsets.all(8),
                          child: Center(
                            child: Text("Edit Product",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800)),
                          ),
                          decoration: BoxDecoration(
                              gradient: pinkRed,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.3), //color of shadow
                                    spreadRadius: 3, //spread radius
                                    blurRadius: 1, // blur radius
                                    offset: const Offset(0, 1))
                              ],
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
