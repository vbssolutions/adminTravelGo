import "package:flutter/material.dart";

Color KprimaryColor = Color(0xFF5cc594);

Color KsecondaryColor = Color(0xFFfa7b28);
Color KbgColor = Color(0xFFf2f2fa);

double Kheight(BuildContext context, double value) {
  return MediaQuery.of(context).size.height * value;
}

double KWigth(BuildContext context, double value) {
  return MediaQuery.of(context).size.width * value;
}

SizedBox KspaceHeight(BuildContext context) {
  return SizedBox(
    height: Kheight(context, 0.05),
  );
}

const defaultPadding = 16.0;
