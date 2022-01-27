import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 150,
              height: 150,
              child: const Image(
                fit: BoxFit.fill,
                image: AssetImage("assets/icons/buyIcon.png"),
              ),
            ),
            FormBuilder(
                child: Column(
              children: [
                FormBuilderTextField(
                  name: 'email',
                  decoration: InputDecoration(
                    hintText: "email",
                  ),
                ),
                FormBuilderTextField(
                  name: 'password',
                  decoration: InputDecoration(
                    hintText: "password",
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
