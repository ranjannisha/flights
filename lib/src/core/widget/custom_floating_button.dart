import 'package:flight/src/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

@immutable
class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
    this.onPressed,
    required this.icon,
    this.btnColor,
  });

  final VoidCallback? onPressed;
  final Widget icon;
  final Color? btnColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: btnColor ?? AppColors.primaryColor,
      elevation: 4,
      child: SizedBox(
        height: 60,
        width: 60,
        child: IconButton(
          onPressed: onPressed,
          icon: icon,
          iconSize: 40,
        ),
      ),
    );
  }
}
