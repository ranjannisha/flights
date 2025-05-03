import 'package:flight/gen/assets.gen.dart';
import 'package:flight/src/core/constants/app_constants.dart';
import 'package:flight/src/core/extensions/num_extensions.dart';
import 'package:flight/src/core/extensions/text_style_extensions.dart';
import 'package:flight/src/core/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLoadingDialog extends StatelessWidget {
  const CustomLoadingDialog({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      shape: RoundedRectangleBorder(borderRadius: 4.rounded),
      backgroundColor: AppColors.whiteColor,
      surfaceTintColor: AppColors.whiteColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            Assets.icons.investment.path,
            height: 50.h,
            width: 50.w,
          ),
          13.verticalSpace,
          Text(
            title,
            style: AppStyles.text14PxMedium.primary,
          ),
        ],
      ),
    );
  }

  static Future<T?> show<T>(BuildContext context, String title) {
    return showDialog<T>(
      context: context,
      barrierDismissible: false,
      routeSettings: const RouteSettings(name: AppConstants.loadingDialog),
      useRootNavigator: false,
      builder: (context) => CustomLoadingDialog(
        title: title,
      ),
    );
  }
}
