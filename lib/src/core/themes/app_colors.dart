import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();
  static const Color  primaryColor = Color(0xFF8F7237);
  static const Color darkPrimaryColor = Color(0xFF0D0D0D);
  static const Color lightPrimaryColor = Color(0xFF0D0D0D);
  static const Color secondaryColor = Color(0xFFA3A3A3);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color buttonColor = Color(0xFFF9DD2E);
  static const Color buttonBlueColor = Color(0xFF184F85);
  static const Color greyColor = Color(0xFF4A4A4A);
  static const Color greyColor200 = Color(0xFFEEEEEE);
  static const Color lightGreyColor = Color(0xFFA2A2A6);
  static const Color borderColor = Color(0xFFFEFDFD);
  static const Color red = Color(0xFFFA1F4B);
  static const Color removeButton = Color(0xFFFF7070);
  static const Color transparent = Colors.transparent;
  static const Color disabled = Color(0xFF4A4A4A);
  static const Color whiteShade = Color(0xFFF6F6F6);
  static const Color errorInputBorderColor = Color(0xFFD20909);
  static Color inputBorderColor = const Color(0xFFFFFFFF).withOpacity(.7);
  static const Color blueColor = Color(0xFF0EA5E9);
  static const Color lightBlueColor = Color(0xFF06A9CA);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color hintTextColor = Color(0xFF969BA0);
  static const Color primaryGrey = Color(0xFFA3A3A3);
  static const Color greyShadeColor = Color(0xff777777);
  static const Color yellowColor = Color(0xFFFFC043);
  static const Color darkYellowColor = Color(0xFFFFAA00);
  static const Color orangeColor = Color(0xFFD0850A);
  static const Color greenColor = Color(0xFF5EC283);
  static const Color topupGreenColor = Color(0xFF2ABA00);
  static const Color darkGreenColor = Color(0xFF2ABA00);
  static const Color solidDarkGreenColor = Color(0xFF0D7B17);
  static const Color gradientBlueColor = Color(0xFF1978BA);
  static const Color gradientBlackColor = Color(0xFF2B2B2B);
  static const Color containerColor = Color(0xFFEEF9FF);
  static const Color moreColor = Color(0xFFA3C0D2);
  static const Color splashBackground1 = Color(0xFFF0F9FF);
  static const Color splashBackground2 = Color(0xFFE5F5FF);
  static const Color midGreyColor = Color(0xffF5F5F5);
  static const Color pageBackgroundColor = Color(0xffEEEEEE);

  static List<Color> landingBackgroundGradient = <Color>[
    const Color(0xFF2229D2).withOpacity(.6),
    const Color(0xFF7022D2).withOpacity(.6),
    const Color(0xFF3B22D2).withOpacity(.6),
  ];

  static LinearGradient landingLinearGradient = LinearGradient(
    colors: landingBackgroundGradient,
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
  );

  static const Color softBlueColor = Color(0xffECF2F6);
  static const Color softWhiteColor = Color(0xffF6F6F6);
  static const Color softBackground = Color(0xff1E1E1E);
  static const Color softMidGrey = Color(0xff959595);
  static const Color softPrimary = Color(0XFFD1E0E8);
}
