import 'package:flight/src/core/extensions/num_extensions.dart';
import 'package:flight/src/core/extensions/text_style_extensions.dart';
import 'package:flight/src/core/extensions/widget_extensions.dart';
import 'package:flight/src/core/themes/app_colors.dart';
import 'package:flight/src/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends FormField<String> {
  CustomTextFormField({
    super.key,
    this.inputDecoration,
    this.prefixIcon,
    this.errorText,
    this.textEditingController,
    this.onSaved,
    this.validator,
    this.onChanged,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.initialValue,
    this.hintText,
    this.hintTextStyle,
    this.helperText,
    this.obscureText,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.focusNode,
    this.formatters,
    this.onFieldSubmitted,
    this.onTap,
    this.showErrorBorder = false,
    this.borderRadius = 6.0,
    this.suffixIcon,
    this.readOnly = false,
    this.contentPadding,
    this.padding = const EdgeInsets.symmetric(horizontal: 4),
    this.textCapitalization = TextCapitalization.none,
    this.height = 48,
    this.textStyle,
    this.maxLength,
    this.maxLines,
    this.showCounter = false,
    this.hintMaxLines,
    this.borderColor,
    this.labelText,
  }) : super(
    onSaved: onSaved,
    validator: validator,
    autovalidateMode: autoValidateMode,
    initialValue: initialValue,
    enabled: enabled,
    builder: (FormFieldState<String> state) {
      BorderSide borderSide = BorderSide(
        color: borderColor ?? AppColors.lightGreyColor,
      );
      return Column(
        children: [
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (labelText != null)
                  Text(
                    labelText,
                    style: AppStyles.text14PxMedium.secondaryColor,
                  ),
                6.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  child: TextFormField(
                    obscureText: obscureText ?? false,
                    maxLines: maxLines ?? 1,
                    textCapitalization: textCapitalization,
                    onChanged: (value) {
                      state.didChange(value);
                      onChanged?.call(value);
                    },
                    readOnly: readOnly,
                    cursorColor: AppColors.whiteColor,
                    textInputAction: textInputAction,
                    keyboardType: keyboardType,
                    focusNode: focusNode,
                    inputFormatters: formatters,
                    enabled: enabled,
                    initialValue: initialValue,
                    controller: textEditingController,
                    onSaved: onSaved,
                    validator: validator,
                    onTap: onTap,
                    minLines: 1,
                    scrollPhysics: const BouncingScrollPhysics(),
                    onFieldSubmitted: onFieldSubmitted,
                    maxLength: maxLength,
                    style: textStyle ??
                        AppStyles.text14PxRegular.whiteColor,
                    decoration: inputDecoration ??
                        InputDecoration(
                          errorMaxLines: 3,
                          alignLabelWithHint: false,
                          counter: showCounter
                              ? const SizedBox.shrink()
                              : null,
                          hintMaxLines: hintMaxLines,
                          hintText: hintText,
                          hintStyle: hintTextStyle ??
                              AppStyles.text12PxRegular.hintTextColor
                                  .lineHeight(18.h),
                          contentPadding: contentPadding ?? 13.all,
                          filled: true,
                          fillColor:
                          AppColors.primaryGrey.withOpacity(0.5),
                          border: OutlineInputBorder(
                            borderSide: borderSide,
                            borderRadius: BorderRadius.circular(borderRadius),
                            gapPadding: 0,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: borderSide,
                            borderRadius: BorderRadius.circular(borderRadius),
                            gapPadding: 0,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: borderSide,
                            borderRadius: BorderRadius.circular(borderRadius),
                            gapPadding: 0,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: borderSide,
                            borderRadius: BorderRadius.circular(borderRadius),
                            gapPadding: 0,
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: borderSide,
                            borderRadius: BorderRadius.circular(borderRadius),
                            gapPadding: 0,
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: borderSide,
                            borderRadius: BorderRadius.circular(borderRadius),
                            gapPadding: 0,
                          ),
                          isDense: true,
                          prefixIcon: prefixIcon,
                          suffixIcon: suffixIcon,
                        ),
                  ),
                ),
              ],
            ),
          ),
          if (errorText != null && errorText.isNotEmpty)
            Text(
              errorText,
              style: AppStyles.text12PxRegular.redColor,
              textAlign: TextAlign.left,
            ).py(10)
          else
            helperText != null
                ? Text(
              helperText,
              style: AppStyles.text12PxRegular.inputBorderColor,
              textAlign: TextAlign.left,
            ).py(10)
                : const SizedBox.shrink(),
        ],
      );
    },
  );
  final InputDecoration? inputDecoration;
  final Widget? prefixIcon;
  final TextEditingController? textEditingController;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode autoValidateMode;
  final String? initialValue;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final String? helperText;
  final String? errorText;
  final bool enabled;
  final TextInputAction? textInputAction;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? formatters;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final void Function(String)? onFieldSubmitted;
  final bool showErrorBorder;
  final double borderRadius;
  final Widget? suffixIcon;
  final bool readOnly;
  final EdgeInsets? contentPadding;
  final EdgeInsets? padding;
  final TextCapitalization textCapitalization;
  final double? height;
  final TextStyle? textStyle;
  final int? maxLength;
  final int? maxLines;
  final bool showCounter;
  final int? hintMaxLines;
  final bool? obscureText;
  final Color? borderColor;
  final String? labelText;
}
