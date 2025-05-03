import 'package:flight/src/core/extensions/text_style_extensions.dart';
import 'package:flight/src/core/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getApplicationTheme(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    fontFamily: GoogleFonts.inter().fontFamily,
    appBarTheme: AppBarTheme(
      surfaceTintColor: AppColors.whiteColor,
      color: AppColors.whiteColor,
      elevation: 0,
      titleTextStyle: AppStyles.text12PxMedium.lineHeight(24),
      titleSpacing: 0,
      centerTitle: true,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
    ),
  );
}
