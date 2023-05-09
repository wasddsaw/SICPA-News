import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicpa_news/features/presentation/utils/common.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: GoogleFonts.roboto().toString(),
    appBarTheme: AppBarTheme(
      titleTextStyle: CustomTextStyles.bodyText7TextStyle,
      backgroundColor: AppColors.primary,
      elevation: 1,
      iconTheme: const IconThemeData(
        color: AppColors.black,
      ),
    ),
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    textTheme: TextTheme(
      labelLarge: GoogleFonts.rubik(
        textStyle: const TextStyle(
          fontSize: 14,
          color: AppColors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          CustomTextStyles.bodyText2TextStyle.copyWith(
            color: AppColors.primary,
          ),
        ),
      ),
    ),
  );
}
