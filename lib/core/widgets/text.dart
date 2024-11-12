import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text customText(BuildContext context, String text, Color color, double size,
    FontWeight fontWeight,
    {TextAlign? textAlign}) {
  return Text(
    text,
    style: GoogleFonts.cairo(
      color: color,
      fontSize: size,
      fontWeight: fontWeight,
    ),
  );
}
