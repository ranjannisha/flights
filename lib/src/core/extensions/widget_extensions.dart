import 'package:flight/src/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

extension WidgetX on Widget {
  Padding px(double padding) => Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: this,
      );

  Padding py(double padding) => Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: this,
      );

  Padding pOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      Padding(
        padding:
            EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
        child: this,
      );

  Padding padAll(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );

  Widget toShimmer() => Shimmer.fromColors(
        baseColor: AppColors.softMidGrey,
        highlightColor: AppColors.midGreyColor,
        //       baseColor: Color(0xFF3A3A3A),
        child: this,
      );
}
