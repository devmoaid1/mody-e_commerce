import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mody_ecommerce/Ui/utilities/app_colors.dart';

class CustomFormField extends StatelessWidget {
  final String? name;
  final Color textColor;
  final Color filledColor;
  final Color hintColor;
  final FormFieldValidator<String>? validator;
  final bool obsecureText;
  final String hint;
  final IconData? prefix;
  final String? initialValue;
  final bool readOnly;
  final TextInputType? keyboard;
  final Function(String?)? onChanged;

  const CustomFormField(
      {Key? key,
      this.onChanged,
      this.hintColor = const Color(0xFFCDA872),
      this.textColor = Colors.black,
      this.filledColor = formFieldFillColor,
      this.keyboard,
      required this.hint,
      required this.name,
      this.obsecureText = false,
      this.prefix,
      this.validator,
      this.initialValue,
      this.readOnly = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      cursorColor: backgroundColor,
      onChanged: onChanged,
      name: name.toString(),
      obscureText: obsecureText,
      readOnly: readOnly,
      initialValue: initialValue,
      validator: validator,
      style: GoogleFonts.poppins(
        color: textColor,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        hintText: hint,
        errorStyle:
            GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
        focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.white)),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.white)),
        hintStyle: TextStyle(color: hintColor, fontWeight: FontWeight.w700),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.white)),
        disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.white)),
        fillColor: filledColor,
        filled: true,
        prefixIcon: Icon(
          prefix,
          color: hintColor,
        ),
      ),
    );
  }
}
