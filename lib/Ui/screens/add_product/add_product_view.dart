import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mody_ecommerce/Ui/utilities/app_colors.dart';
import 'package:mody_ecommerce/Ui/utilities/screen_sizes.dart';
import 'package:mody_ecommerce/Ui/widgets/custom_text_field.dart';

class AddProductView extends StatelessWidget {
  AddProductView({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222725),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Add Product",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w800, fontSize: 22, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 60.0, right: 15),
        child: SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    child: CustomFormField(
                      textColor: Colors.white,
                      hintColor: const Color(0xFF85A6C5),
                      filledColor: Colors.transparent,
                      hint: "product name",
                      name: "productName",
                      validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required(context)]),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    child: CustomFormField(
                      textColor: Colors.white,
                      hintColor: const Color(0xFF85A6C5),
                      filledColor: Colors.transparent,
                      hint: "product category",
                      name: "productCategory",
                      validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required(context)]),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    child: CustomFormField(
                      textColor: Colors.white,
                      hintColor: const Color(0xFF85A6C5),
                      filledColor: Colors.transparent,
                      hint: "product description",
                      name: "productDescription",
                      validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required(context)]),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    child: CustomFormField(
                      textColor: Colors.white,
                      hintColor: const Color(0xFF85A6C5),
                      filledColor: Colors.transparent,
                      hint: "product price",
                      name: "productPrice",
                      keyboard: TextInputType.number,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.numeric(context)
                      ]),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    child: CustomFormField(
                      textColor: Colors.white,
                      hintColor: const Color(0xFF85A6C5),
                      filledColor: Colors.transparent,
                      hint: "product Location",
                      name: "productLocation",
                      validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required(context)]),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight(context) * 0.05,
                  ),
                  Container(
                    width: screenHeight(context),
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Text("Add Product",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w800)),
                    ),
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.pink, Colors.red]),
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
                ],
              )),
        ),
      ),
    );
  }
}
