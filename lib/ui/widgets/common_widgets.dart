import 'package:car_catalog/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

reusableText(String text,
    {double fontSize = 24,
    Color fontColor = ColorProvider.mainTextLight,
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

reusableAppBar(String text, fontColor) {
  return AppBar(
    title: reusableText(text, fontColor: fontColor),
    centerTitle: true,
  );
}

reusableSearchBar(TextEditingController textEditingController, Function() func,
    Function(String value) func1, bool isDarkMode) {
  return Container(
    width: 375.w,
    margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
    child: TextFormField(
      controller: textEditingController,
      cursorColor: isDarkMode ? ColorProvider.secondaryElementDark : ColorProvider.secondaryElementLight,
      decoration: InputDecoration(
        hintText: "Search",
        border: InputBorder.none,
        hoverColor: isDarkMode ? ColorProvider.secondaryElementDark : ColorProvider.secondaryElementLight,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: isDarkMode ? ColorProvider.secondaryElementDark : ColorProvider.secondaryElementLight,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: isDarkMode ? ColorProvider.secondaryElementDark : ColorProvider.secondaryElementLight,
          ),
        ),
        hintStyle: GoogleFonts.notoSans(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: isDarkMode ? ColorProvider.secondaryTextDark : ColorProvider.secondaryTextLight,
          letterSpacing: 1,
        ),
        suffixIcon: IconButton(
          onPressed: func,
          icon:  Icon(Icons.close, color: isDarkMode ? ColorProvider.mainTextDark : ColorProvider.mainTextLight),
        ),
      ),
      onChanged: func1,
    ),
  );
}
