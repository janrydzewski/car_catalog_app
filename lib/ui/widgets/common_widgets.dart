import 'package:car_catalog/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

reusableText(String text,
    {double fontSize = 24,
    Color fontColor = ColorProvider.mainText,
    FontWeight fontWeight = FontWeight.w500,
    double letterSpacing = 0,
    TextAlign textAlign = TextAlign.start}) {
  return Text(
    text,
    textAlign: textAlign,
    style: GoogleFonts.notoSans(
        fontSize: fontSize.sp,
        color: fontColor,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing),
  );
}

reusableAppBar(String text) {
  return AppBar(
    title: reusableText(text),
    centerTitle: true,
  );
}
