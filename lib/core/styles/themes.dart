import 'package:bookia_app/core/constants/app_design.dart';
import 'package:bookia_app/core/constants/app_fonts.dart';
import 'package:bookia_app/core/styles/app_colors.dart';
import 'package:bookia_app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData get lightTheme => ThemeData(
    fontFamily: AppFonts.dMSerifDisplayFamily,
    scaffoldBackgroundColor: LightPalette.background,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primaryColor: LightPalette.primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: LightPalette.background,
      foregroundColor: LightPalette.textPrimary,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyles.title1.copyWith(
        color: LightPalette.textPrimary,
        fontFamily: AppFonts.dMSerifDisplayFamily,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.caption1.copyWith(color: LightPalette.greyColor),
      fillColor: LightPalette.whiteColor,
      filled: true,
      errorStyle: TextStyles.caption2.copyWith(color: LightPalette.redColor),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDesign.borderRadius),
        borderSide: BorderSide(color: LightPalette.borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDesign.borderRadius),
        borderSide: BorderSide(color: LightPalette.primaryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDesign.borderRadius),
        borderSide: BorderSide(color: LightPalette.redColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDesign.borderRadius),
        borderSide: BorderSide(color: LightPalette.redColor),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: LightPalette.primaryColor,
      onSurface: LightPalette.textPrimary,
      error: LightPalette.redColor,
      tertiary: LightPalette.greyColor,
      surfaceContainer: DarkPalette.textPrimary,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: LightPalette.background,
      surfaceTintColor: Colors.transparent,
    ),

    dividerTheme: DividerThemeData(color: LightPalette.borderColor),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: LightPalette.greyColor,
        padding: EdgeInsets.zero,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: LightPalette.primaryColor,
        foregroundColor: LightPalette.whiteColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDesign.borderRadius),
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
  );
}
