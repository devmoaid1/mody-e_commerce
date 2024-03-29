import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mody_ecommerce/Ui/screens/Login/login_view_model.dart';
import 'package:mody_ecommerce/Ui/utilities/app_colors.dart';
import 'package:mody_ecommerce/Ui/utilities/screen_sizes.dart';
import 'package:mody_ecommerce/Ui/widgets/custom_text_field.dart';
import 'package:stacked/stacked.dart';

import '../../../app/constants/assets.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          progressIndicator: const CircularProgressIndicator(
            color: backgroundColor,
          ),
          inAsyncCall: model.isLoading,
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //logo
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: SizedBox(
                      height: screenHeightPercentage(context, percentage: 0.2),
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
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            child: CustomFormField(
                              hint: "Enter your Email",
                              name: "email",
                              keyboard: TextInputType.emailAddress,
                              hintColor:
                                  const Color.fromARGB(255, 158, 155, 155),
                              filledColor:
                                  const Color.fromARGB(255, 224, 229, 230),
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
                              obsecureText: true,
                              prefix: Icons.lock,
                              hintColor:
                                  const Color.fromARGB(255, 158, 155, 155),
                              filledColor:
                                  const Color.fromARGB(255, 224, 229, 230),
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
                                _formKey.currentState!.save();
                                if (_formKey.currentState!.validate()) {
                                  final email =
                                      _formKey.currentState!.value['email'];
                                  final password =
                                      _formKey.currentState!.value['password'];

                                  model.login(email: email, password: password);
                                }
                              },
                              child: Text(
                                "Login",
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Dont Have An account ?",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          TextButton(
                              onPressed: () {
                                model.navigateToSignUp();
                              },
                              child: Text(
                                "Sign Up",
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: backgroundColor),
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextButton(
                                onPressed: () {
                                  model.isAdmin
                                      ? model.setIsAdmin(false)
                                      : model.setIsAdmin(true);
                                },
                                child: Text(
                                  model.isAdmin ? "User?" : "Admin?",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: backgroundColor),
                                )),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
