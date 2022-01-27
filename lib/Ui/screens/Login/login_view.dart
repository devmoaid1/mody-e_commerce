import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('buyicon.png'),
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
                  name: 'email',
                  decoration: InputDecoration(
                    hintText: "email",
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
