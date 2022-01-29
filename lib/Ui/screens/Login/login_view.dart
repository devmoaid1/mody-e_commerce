import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mody_ecommerce/Ui/utilities/app_colors.dart';
import 'package:mody_ecommerce/Ui/utilities/screen_sizes.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //logo
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Container(
                  // color: Colors.blue,
                  height: screenHeight(context) * 0.25,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 80,
                          child: const Image(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/icons/buyIcon.png"),
                          ),
                        ),
                        Text("Buy It!",
                            style: GoogleFonts.pacifico(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic))
                      ],
                    ),
                  ),
                ),
              ),

              //form
              Container(
                child: FormBuilder(
                    child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      child: FormBuilderTextField(
                        keyboardType: TextInputType.emailAddress,
                        name: 'email',
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                          FormBuilderValidators.email(context),
                        ]),
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Colors.white)),
                            fillColor: formFieldFillColor,
                            filled: true,
                            prefixIcon: Icon(
                              Icons.email,
                              color: backgroundColor,
                            ),
                            hintText: "Enter your email ",
                            hintStyle: TextStyle(
                                color: Color(0xFFCDA872),
                                fontWeight: FontWeight.w800)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: FormBuilderTextField(
                        name: 'password',
                        obscureText: true,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.white)),
                          hintStyle: TextStyle(
                              color: Color(0xFFCDA872),
                              fontWeight: FontWeight.w700),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.white)),
                          fillColor: formFieldFillColor,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: backgroundColor,
                          ),
                          hintText: "Enter your password",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context) * 0.05,
                    ),
                    Container(
                      width: screenWidth(context),
                      child: TextButton(
                        onPressed: null,
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
              ),
              SizedBox(
                height: screenHeight(context) * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont Have An account ?",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TextButton(
                      onPressed: null,
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
