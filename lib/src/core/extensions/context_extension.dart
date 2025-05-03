import 'package:flight/l10n/l10n.dart';
import 'package:flight/src/core/di/injection.dart';
import 'package:flight/src/core/extensions/num_extensions.dart';
import 'package:flight/src/core/extensions/text_style_extensions.dart';
import 'package:flight/src/core/routes/app_router.dart';
import 'package:flight/src/core/themes/app_colors.dart';
import 'package:flight/src/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

extension ContextX on BuildContext {
  ///width and height getter
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  ///paddings getter
  EdgeInsets get padding => MediaQuery.of(this).padding;

  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;

  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  Orientation get orientation => MediaQuery.of(this).orientation;

  void showSuccessSnackbar(
      {required String title,
      required String message,
      double? padding,
      int? seconds}) {
    OverlayState? overlayState = Overlay.of(this);
    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        top: context.padding.top + (padding ?? 40),
        width: context.width,
        child: Material(
          color: AppColors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: 17.rounded,
            ),
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            padding:
                const EdgeInsets.only(left: 18, top: 15, right: 12, bottom: 12),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                        AppStyles.text14PxMedium.whiteColor.lineHeight(16.59)),
                const SizedBox(height: 6),
                Text(
                  message,
                  style: AppStyles.text14PxRegular
                      .lineHeight(16.59)
                      .copyWith(color: AppColors.whiteColor.withOpacity(0.7)),
                  // overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      );
    });

    overlayState.insert(overlayEntry);
    Future.delayed(Duration(seconds: (seconds ?? 4))).then((value) {
      overlayEntry?.remove();
    });
  }

  void noInternet() =>
      showErrorSnackBar(title: l10n.error, message: l10n.noInternetConnection);

  void showErrorSnackBar({
    required String title,
    required String message,
  }) {
    final context = getIt<AppRouter>().navigatorKey.currentContext ?? this;
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        top: context.padding.top + 40,
        width: context.width,
        child: Material(
          color: AppColors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.errorInputBorderColor,
              borderRadius: 17.rounded,
            ),
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            padding:
                const EdgeInsets.only(left: 18, top: 15, right: 12, bottom: 12),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                        AppStyles.text14PxMedium.whiteColor.lineHeight(16.59)),
                const SizedBox(height: 6),
                Text(
                  message,
                  style: AppStyles.text14PxRegular
                      .lineHeight(16.59)
                      .copyWith(color: AppColors.whiteColor.withOpacity(0.7)),
                  // overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      );
    });
    overlayState.insert(overlayEntry);
    Future.delayed(const Duration(seconds: 4)).then((value) {
      overlayEntry.remove();
    });
  }

  void removeFocus() {
    if (FocusScope.of(this).hasFocus || FocusScope.of(this).hasPrimaryFocus) {
      FocusScope.of(this).unfocus();
    }
  }
}
