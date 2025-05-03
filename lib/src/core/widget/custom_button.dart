import 'package:flight/src/core/enums/app_enums.dart';
import 'package:flight/src/core/extensions/text_style_extensions.dart';
import 'package:flight/src/core/helpers/utility.dart';
import 'package:flight/src/core/themes/app_colors.dart';
import 'package:flight/src/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.title,
    this.onPressed,
    this.titleStyle,
    this.backgroundColor = AppColors.buttonColor,
    this.shape,
    this.width = 140,
    this.height = 40,
    this.loading = false,
    this.isDisabled = false,
    this.elevation = 0,
    this.splashColor,
    this.icon,
    this.padding,
    this.borderRadiusGeometry,
    this.borderColor,
  });

  /// [title] argument is required
  final String? title;

  final double elevation;

  final VoidCallback? onPressed;

  /// [titleStyle] is used to style the button text
  final TextStyle? titleStyle;

  /// [gradient] for enabled state of button
  final Color backgroundColor;

  /// [shape] is used to apply border radius on button,
  final ShapeBorder? shape;

  /// [width] button width, defaults is 140
  final double width;

  /// [height] button height, defaults is 44
  final double height;

  /// [loading] is used to display circular progress indicator on loading event, default is false
  final bool loading;

  /// [isDisabled] is used to disable to button, default is true
  final bool isDisabled;

  final Color? splashColor;

  final Widget? icon;

  final EdgeInsetsGeometry? padding;

  final BorderRadiusGeometry? borderRadiusGeometry;

  final Color? borderColor;

  ShapeBorder get _shape =>
      shape ??
      RoundedRectangleBorder(
        borderRadius: borderRadiusGeometry ?? BorderRadius.circular(8.r),
        side: BorderSide(
          color: (backgroundColor == AppColors.whiteColor)
              ? borderColor ?? AppColors.primaryColor
              : AppColors.transparent,
        ),
      );

  BoxConstraints get _constraints =>
      BoxConstraints.tightFor(width: width, height: height);

  Color get _splashColor => splashColor != null
      ? splashColor!
      : (backgroundColor == AppColors.whiteColor
          ? AppColors.greyColor.withOpacity(0.4)
          : AppColors.whiteColor.withOpacity(0.4));

  @override
  Widget build(BuildContext context) {
    final deviceType = Utility.getDeviceScreenType(MediaQuery.of(context));
    return Material(
      type: MaterialType.card,
      clipBehavior: Clip.antiAlias,
      shape: _shape,
      elevation: elevation,
      shadowColor: AppColors.whiteColor,
      child: AnimatedContainer(
        height: 40.h,
        duration: const Duration(milliseconds: 400),
        color: backgroundColor,
        child: InkWell(
          splashColor: _splashColor,
          onTap: loading || isDisabled
              ? null
              : () {
                  FocusScope.of(context).unfocus();
                  onPressed?.call();
                },
          child: ConstrainedBox(
            constraints: _constraints,
            child: Ink(
              decoration: ShapeDecoration(
                shape: _shape,
                color: backgroundColor,
              ),
              child: loading
                  ? Center(
                      child: SizedBox(
                        width:
                            deviceType == DeviceScreenType.tablet ? 14.w : 24.w,
                        height:
                            deviceType == DeviceScreenType.tablet ? 14.w : 24.h,
                        child: CircularProgressIndicator(
                          color: backgroundColor == AppColors.whiteColor ||
                                  backgroundColor == AppColors.transparent
                              ? AppColors.buttonColor
                              : AppColors.whiteColor,
                          strokeWidth: 2,
                        ),
                      ),
                    )
                  : Padding(
                      padding: padding ?? EdgeInsets.zero,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (icon != null) icon!,
                          if (icon != null) 10.horizontalSpace,
                          Text(
                            title ?? '',
                            style: titleStyle ??
                                ((backgroundColor == AppColors.blackColor)
                                    ? AppStyles.text14PxMedium.primary
                                        .lineHeight(16.59)
                                    : AppStyles.text14PxMedium.blackColor
                                        .lineHeight(16.59)),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
