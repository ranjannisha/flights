import 'package:flutter/material.dart';
import 'package:flight/src/core/enums/app_enums.dart';

class SizingInformation {
  SizingInformation({
    required this.deviceScreenType,
    required this.screenSize,
    required this.localWidgetSize,
  });

  final DeviceScreenType deviceScreenType;
  final Size screenSize;
  final Size localWidgetSize;

  @override
  String toString() {
    return 'DeviceType:$deviceScreenType ScreenSize: $screenSize LocalWidgetSIze : $localWidgetSize';
  }
}
