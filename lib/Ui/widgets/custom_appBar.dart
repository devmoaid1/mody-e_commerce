import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget modyAppBar(
    {required String? title, Color? foregroundColor, Widget? leading}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    foregroundColor: foregroundColor,
    elevation: 0,
    leading: leading,
    centerTitle: true,
    title: Text(
      title.toString(),
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.w800, fontSize: 22, color: Colors.white),
    ),
  );
}
