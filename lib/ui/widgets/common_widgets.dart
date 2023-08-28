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

reusableSearchBar(TextEditingController textEditingController, Function() func,
    Function(String value) func1) {
  return Container(
    width: 375.w,
    margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
    child: TextFormField(
      controller: textEditingController,
      cursorColor: ColorProvider.fourthElement,
      decoration: InputDecoration(
        hintText: "Search",
        border: InputBorder.none,
        hoverColor: ColorProvider.fourthElement,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: ColorProvider.fourthElement,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: ColorProvider.fourthElement,
          ),
        ),
        hintStyle: GoogleFonts.notoSans(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: ColorProvider.secondaryText,
          letterSpacing: 1,
        ),
        suffixIcon: IconButton(
          onPressed: func,
          icon: const Icon(Icons.close, color: ColorProvider.mainText),
        ),
      ),
      onChanged: func1,
    ),
  );
}
