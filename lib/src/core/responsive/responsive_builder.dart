import 'package:flutter/material.dart';
import 'package:flight/src/core/helpers/utility.dart';
import 'package:flight/src/core/responsive/sizing_information.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({super.key, required this.builder});

  final Widget Function(
      BuildContext context, SizingInformation sizingInformation) builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints boxConstraint) {
        final MediaQueryData mediaQuery = MediaQuery.of(context);
        final SizingInformation sizingInformation = SizingInformation(
          deviceScreenType: Utility.getDeviceScreenType(mediaQuery),
          screenSize: mediaQuery.size,
          localWidgetSize:
          Size(boxConstraint.maxWidth, boxConstraint.maxHeight),
        );
        return builder(context, sizingInformation);
      },
    );
  }
}