import 'package:flight/l10n/l10n.dart';
import 'package:flight/src/core/extensions/text_style_extensions.dart';
import 'package:flight/src/core/themes/app_colors.dart';
import 'package:flight/src/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorHandlerWidget extends StatelessWidget {
  const ErrorHandlerWidget({
    super.key,
    required this.errorMessage,
    required this.onRetry,
    this.onRetryVisible = true,
  });
  final String? errorMessage;
  final void Function() onRetry;
  final bool onRetryVisible;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          child: Column(
            children: [
              Text(errorMessage!, style: AppStyles.text12PxMedium.primary),
              SizedBox(
                height: 10.h,
              ),
              if (onRetryVisible)
                GestureDetector(
                  onTap: onRetry.call,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Text(l10n.retry),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
