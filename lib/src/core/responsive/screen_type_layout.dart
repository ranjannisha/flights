import 'package:flutter/material.dart';
import 'package:flight/src/core/enums/app_enums.dart';
import 'package:flight/src/core/responsive/responsive_builder.dart';
import 'package:flight/src/core/responsive/sizing_information.dart';
class ScreenTypeLayout extends StatelessWidget {
  const ScreenTypeLayout(
      {super.key, this.mobile, this.tablet, required this.desktop});
  final Widget? mobile;
  final Widget? tablet;

  final Widget desktop;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1250 &&
          MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1250;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          if (mobile != null) {
            return desktop;
          }
        } else if (sizingInformation.deviceScreenType ==
            DeviceScreenType.tablet) {
          return tablet ?? desktop;
        }
        return mobile ?? desktop;
      },
    );
  }
}
