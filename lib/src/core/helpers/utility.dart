import 'package:flight/src/core/enums/app_enums.dart';
import 'package:flutter/material.dart';

class Utility {
  const Utility._();
  static double calculateLetterSpacing(double value) => value * 16;
  static DeviceScreenType getDeviceScreenType(MediaQueryData mediaQueryData) {
    final double deviceWidth = mediaQueryData.size.width;
    if (deviceWidth < 650) {
      return DeviceScreenType.mobile;
    } else if (deviceWidth < 1250 && deviceWidth >= 650) {
      return DeviceScreenType.tablet;
    }
    return DeviceScreenType.desktop;
  }
}
