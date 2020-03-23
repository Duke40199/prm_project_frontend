import 'package:flutter/material.dart';

// Text
TextStyle textStyleDefault =
    TextStyle(fontFamily: 'Montserrat', fontSize: 18.0, color: colorTextPrimary);
TextStyle textStyleHeading = textStyleDefault.copyWith(
  fontWeight: FontWeight.bold,
  fontSize: 26.0,
);
TextStyle textStyleHeadingPrimary = textStyleHeading.copyWith(
  color: colorPrimary,
);
TextStyle textStyleHeadingDark = textStyleHeading.copyWith(
  color: colorTextDarkBackground,
);
TextStyle textStyleTitle = textStyleDefault.copyWith(
  fontWeight: FontWeight.bold,
  fontSize: 22.0,
);
TextStyle textStyleTitlePrimary = textStyleDefault.copyWith(
  fontWeight: FontWeight.bold,
  fontSize: 22.0,
  color: colorPrimary,
);
TextStyle textStyleTitleDarkBackground = textStyleDefault.copyWith(
  fontWeight: FontWeight.bold,
  fontSize: 22.0,
  color: colorTextDarkBackground,
);
TextStyle textStyleSubtitle = textStyleDefault.copyWith(
  fontSize: 20.0,
);

TextStyle textStyleErrorMessage = TextStyle(color: colorError);

TextStyle textStyleButtonPrimary = TextStyle(
  fontSize: 15,
  color: colorTextPrimary,
);

TextStyle textStyleDefaultPrimary = textStyleDefault.copyWith(
  color: colorPrimary,
);

TextStyle textStyleDarkBackground = textStyleDefault.copyWith(
  color: colorTextDarkBackground,
);

// Color
Color colorPrimary = Colors.purple;
Color colorBackground = Colors.white;
Color colorBackgroundDark = Colors.black;
Color colorInactive = Colors.grey;
Color colorError = Colors.red;
Color colorTextPrimary = Colors.black;
Color colorTextDarkBackground = Colors.white;
Color colorAppBar = Colors.white;
//decoration

BoxDecoration decorationRoundContainer = BoxDecoration(
  color: Colors.green,
  borderRadius: new BorderRadius.only(
  topLeft: Radius.circular(20),
  topRight: Radius.circular(20),
  )
);


// Textbox Width
const double textboxWidthMedium = 220.0;
const double textboxWidthLarge = 280.0;