import 'package:flutter/material.dart';

class EditProductView extends StatelessWidget {
  const EditProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
      ),
    );
  }
}
