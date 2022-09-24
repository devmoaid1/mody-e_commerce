import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mody_ecommerce/Ui/screens/Sign_up/Sign_up_view_model.dart';
import 'package:mody_ecommerce/Ui/utilities/app_colors.dart';
import 'package:mody_ecommerce/Ui/utilities/screen_sizes.dart';
import 'package:mody_ecommerce/Ui/widgets/custom_text_field.dart';
import 'package:stacked/stacked.dart';

import '../../../app/constants/assets.dart';

class SignUpView extends StatelessWidget {
  SignUpView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: model.isLoading,
          color: backgroundColor,
          progressIndicator: const CircularProgressIndicator(
            color: backgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //logo
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: SizedBox(
                      height: screenHeightPercentage(context, percentage: 0.17),
                      child: const Image(
                        fit: BoxFit.fill,
                        image: AssetImage(Assets.modyIcon),
                      ),
                    ),
                  ),
                  verticalSpaceMedium,
                  //form
                  FormBuilder(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: CustomFormField(
                              hint: "Enter your name",
                              name: "userName",
                              hintColor:
                                  const Color.fromARGB(255, 158, 155, 155),
                              filledColor:
                                  const Color.fromARGB(255, 224, 229, 230),
                              keyboard: TextInputType.text,
                              prefix: Icons.account_circle,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                              ]),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            child: CustomFormField(
                              hint: "Enter your Email",
                              name: "email",
                              hintColor:
                                  const Color.fromARGB(255, 158, 155, 155),
                              filledColor:
                                  const Color.fromARGB(255, 224, 229, 230),
                              keyboard: TextInputType.emailAddress,
                              prefix: Icons.email,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.email(context)
                              ]),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: CustomFormField(
                              hint: "Enter your password",
                              name: "password",
                              hintColor:
                                  const Color.fromARGB(255, 158, 155, 155),
                              filledColor:
                                  const Color.fromARGB(255, 224, 229, 230),
                              obsecureText: true,
                              prefix: Icons.lock,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                              ]),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight(context) * 0.05,
                          ),
                          SizedBox(
                            width: screenWidth(context),
                            child: TextButton(
                              onPressed: () {
                                _formKey.currentState?.save();
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  final email =
                                      _formKey.currentState!.value['email'];
                                  final password =
                                      _formKey.currentState!.value['password'];
                                  model.signUp(
                                      email: email, password: password);
                                }
                              },
                              child: Text(
                                "Sign Up",
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(10.0),
                                primary: Colors.black,
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                  SizedBox(
                    height: screenHeight(context) * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Do Have An account ?",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextButton(
                          onPressed: () {
                            model.navigateToLogin();
                          },
                          child: Text(
                            "Login",
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: backgroundColor),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
