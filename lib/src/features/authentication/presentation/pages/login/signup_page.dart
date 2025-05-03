import 'package:auto_route/auto_route.dart';
import 'package:flight/gen/assets.gen.dart';
import 'package:flight/l10n/l10n.dart';
import 'package:flight/src/core/di/injection.dart';
import 'package:flight/src/core/enums/app_enums.dart';
import 'package:flight/src/core/extensions/context_extension.dart';
import 'package:flight/src/core/extensions/string_extension.dart';
import 'package:flight/src/core/extensions/text_style_extensions.dart';
import 'package:flight/src/core/extensions/widget_extensions.dart';
import 'package:flight/src/core/routes/app_router.dart';
import 'package:flight/src/core/themes/app_colors.dart';
import 'package:flight/src/core/themes/app_styles.dart';
import 'package:flight/src/core/widget/custom_button.dart';
import 'package:flight/src/core/widget/custom_textform_field.dart';
import 'package:flight/src/core/widget/scaffold_wrapper.dart';
import 'package:flight/src/features/authentication/data/models/request/login_request_params.dart';
import 'package:flight/src/features/authentication/presentation/bloc/login/form_field/login_form_field_cubit.dart';
import 'package:flight/src/features/authentication/presentation/bloc/signup/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flight/src/core/responsive/responsive_builder.dart';
import 'package:flight/src/core/responsive/sizing_information.dart';

@RoutePage()
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscureTextMPin = false;
  String errorText = '';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<SignupCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<LoginFormFieldCubit>(),
          ),
        ],
        child: ScaffoldWrapper(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white60,
          body: ResponsiveBuilder(builder:
              (BuildContext context, SizingInformation sizingInformation) {
            return Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  Assets.icons.background.path,
                  width: context.width, // Adjust width as needed
                  height: context.height, // Adjust height as needed
                  fit: BoxFit.cover,
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      context.orientation == Orientation.portrait
                          ? 0.verticalSpace
                          : 90.verticalSpace,
                      context.orientation == Orientation.portrait
                          ? (sizingInformation.deviceScreenType ==
                          DeviceScreenType.tablet
                          ? 100.verticalSpace
                          : 48.verticalSpace)
                          : (sizingInformation.deviceScreenType ==
                          DeviceScreenType.tablet
                          ? 100.verticalSpace
                          : 150.verticalSpace),
                      BlocBuilder<SignupCubit, SignupState>(
                        builder: (context, state) {
                          return state.map(initial: (value) {
                            return const SizedBox.shrink();
                          }, loading: (value) {
                            return const SizedBox.shrink();
                          }, noInternet: (value) {
                            return const SizedBox.shrink();
                          }, error: (value) {
                            return Text(
                              value.message,
                              style: sizingInformation.deviceScreenType ==
                                  DeviceScreenType.tablet
                                  ? AppStyles.text6PxRegular.redColor
                                  : AppStyles.text12PxRegular.redColor,
                            );
                          }, success: (value) {
                            return const SizedBox.shrink();
                          });
                        },
                      ),
                      BlocBuilder<LoginFormFieldCubit, LoginFormFieldState>(
                        buildWhen: (previous, current) =>
                        current.loginFormEntity.userName !=
                            previous.loginFormEntity.userName,
                        builder: (context, state) {
                          return Directionality(
                            textDirection: TextDirection.ltr,
                            child: CustomTextFormField(
                              borderRadius:
                              context.orientation == Orientation.portrait
                                  ? 6.r
                                  : (sizingInformation.deviceScreenType ==
                                  DeviceScreenType.tablet
                                  ? 10.r
                                  : 20.r),
                              hintTextStyle: context.orientation ==
                                  Orientation.portrait
                                  ? (sizingInformation.deviceScreenType ==
                                  DeviceScreenType.tablet
                                  ? AppStyles.text6PxRegular.hintTextColor
                                  : AppStyles.text12PxRegular.hintTextColor)
                                  : (sizingInformation.deviceScreenType ==
                                  DeviceScreenType.tablet
                                  ? AppStyles.text6PxRegular.hintTextColor
                                  : AppStyles.text8PxRegular.hintTextColor),
                              textStyle: context.orientation ==
                                  Orientation.portrait
                                  ? (sizingInformation.deviceScreenType ==
                                  DeviceScreenType.tablet
                                  ? AppStyles.text8PxRegular.whiteColor
                                  : AppStyles.text12PxRegular.whiteColor)
                                  : (sizingInformation.deviceScreenType ==
                                  DeviceScreenType.tablet
                                  ? AppStyles.text6PxRegular.whiteColor
                                  : AppStyles.text8PxRegular.whiteColor),
                              prefixIcon: SvgPicture.asset(
                                Assets.icons.user.path,
                              ).padAll(
                                  context.orientation == Orientation.portrait
                                      ? (sizingInformation.deviceScreenType ==
                                      DeviceScreenType.tablet
                                      ? 6.sp
                                      : 10.sp)
                                      : 6.sp),
                              onTap: context
                                  .read<LoginFormFieldCubit>()
                                  .setUserNameTouched,
                              borderColor:
                              state.loginFormEntity.userName.isTouched
                                  ? AppColors.primaryColor
                                  : null,
                              textEditingController:
                              userNameController.text.isNotNullNotEmpty
                                  ? userNameController
                                  : null,
                              showErrorBorder: state.loginFormEntity.userName
                                  .errorMessage.isNotEmpty,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              onChanged: context
                                  .read<LoginFormFieldCubit>()
                                  .onUserNameChanged,
                              hintText: l10n.userName,
                            ),
                          );
                        },
                      ),
                      context.orientation == Orientation.portrait
                          ? 14.verticalSpace
                          : (sizingInformation.deviceScreenType ==
                          DeviceScreenType.tablet
                          ? 30.verticalSpace
                          : 90.verticalSpace),
                      BlocBuilder<LoginFormFieldCubit, LoginFormFieldState>(
                        buildWhen: (previous, current) =>
                        current.loginFormEntity.password !=
                            previous.loginFormEntity.password,
                        builder: (context, state) {
                          return Directionality(
                            textDirection: TextDirection.ltr,
                            child: CustomTextFormField(
                              hintTextStyle: context.orientation ==
                                  Orientation.portrait
                                  ? (sizingInformation.deviceScreenType ==
                                  DeviceScreenType.tablet
                                  ? AppStyles.text6PxRegular.hintTextColor
                                  : AppStyles.text12PxRegular.hintTextColor)
                                  : (sizingInformation.deviceScreenType ==
                                  DeviceScreenType.tablet
                                  ? AppStyles.text6PxRegular.hintTextColor
                                  : AppStyles.text8PxRegular.hintTextColor),
                              textStyle: context.orientation ==
                                  Orientation.portrait
                                  ? (sizingInformation.deviceScreenType ==
                                  DeviceScreenType.tablet
                                  ? AppStyles.text8PxRegular.whiteColor
                                  .lineHeight(18.h)
                                  : AppStyles.text12PxRegular.whiteColor
                                  .lineHeight(18.h))
                                  : (sizingInformation.deviceScreenType ==
                                  DeviceScreenType.tablet
                                  ? AppStyles.text6PxRegular.whiteColor
                                  : AppStyles.text8PxRegular.whiteColor),
                              borderRadius:
                              context.orientation == Orientation.portrait
                                  ? 6.r
                                  : (sizingInformation.deviceScreenType ==
                                  DeviceScreenType.tablet
                                  ? 10.r
                                  : 20.r),
                              onTap: context
                                  .read<LoginFormFieldCubit>()
                                  .setPasswordTouched,
                              prefixIcon:
                              SvgPicture.asset(Assets.icons.lock.path)
                                  .padAll(context.orientation ==
                                  Orientation.portrait
                                  ? (sizingInformation
                                  .deviceScreenType ==
                                  DeviceScreenType.tablet
                                  ? 6.sp
                                  : 10.sp)
                                  : 6.sp),
                              obscureText: obscureTextMPin,
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    obscureTextMPin = !obscureTextMPin;
                                  });
                                  context
                                      .read<LoginFormFieldCubit>()
                                      .setPasswordObscure(
                                      isObscure: obscureTextMPin);
                                },
                                child: SvgPicture.asset(
                                  obscureTextMPin
                                      ? Assets.icons.eyeon.path
                                      : Assets.icons.eyeoff.path,
                                ).padAll(
                                    context.orientation == Orientation.portrait
                                        ? (sizingInformation.deviceScreenType ==
                                        DeviceScreenType.tablet
                                        ? 6.sp
                                        : 10.sp)
                                        : 6.sp),
                              ),
                              borderColor:
                              state.loginFormEntity.password.isTouched
                                  ? AppColors.greyColor
                                  : null,
                              textEditingController:
                              passwordController.text.isNotNullNotEmpty
                                  ? passwordController
                                  : null,
                              showErrorBorder: state.loginFormEntity.password
                                  .errorMessage.isNotEmpty,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              onChanged: context
                                  .read<LoginFormFieldCubit>()
                                  .onPasswordChanged,
                              hintText: l10n.password,
                            ),
                          );
                        },
                      ),
                      context.orientation == Orientation.portrait
                          ? 24.verticalSpace
                          : (sizingInformation.deviceScreenType ==
                          DeviceScreenType.tablet
                          ? 40.verticalSpace
                          : 90.verticalSpace),
                      Column(
                        children: [
                          BlocListener<SignupCubit, SignupState>(
                              listener: (context, state) {
                                state.maybeWhen(
                                  orElse: () {},
                                  noInternet: () => context.noInternet(),
                                  error: (errorMessage) {},
                                  success: (data) {
                                    context.router
                                        .push(const DashboardRoute());
                                  },
                                );
                              },
                              child: BlocBuilder<LoginFormFieldCubit,
                                  LoginFormFieldState>(
                                buildWhen: (previous, current) =>
                                current.loginFormEntity !=
                                    previous.loginFormEntity,
                                builder: (context, state) {
                                  return CustomButton(
                                    height: context.orientation ==
                                        Orientation.portrait
                                        ? (sizingInformation.deviceScreenType ==
                                        DeviceScreenType.tablet
                                        ? 32.h
                                        : 40.h)
                                        : (sizingInformation.deviceScreenType ==
                                        DeviceScreenType.tablet
                                        ? 90.h
                                        : 110.h),
                                    backgroundColor: AppColors.buttonColor,
                                    width: context.width,
                                    isDisabled: false,
                                    loading: context.select<SignupCubit, bool>(
                                            (bloc) => bloc.state.maybeWhen(
                                            orElse: () => false,
                                            loading: () => true)),
                                    title: l10n.signUp,
                                    titleStyle: context.orientation ==
                                        Orientation.portrait
                                        ? (sizingInformation.deviceScreenType ==
                                        DeviceScreenType.tablet
                                        ? AppStyles.text6PxRegular.whiteColor.copyWith(
                                        overflow: TextOverflow.ellipsis)
                                        : AppStyles.text14PxRegular.whiteColor
                                        .copyWith(
                                        overflow:
                                        TextOverflow.ellipsis))
                                        : (sizingInformation.deviceScreenType ==
                                        DeviceScreenType.tablet
                                        ? AppStyles.text6PxRegular.whiteColor.copyWith(
                                        overflow: TextOverflow.ellipsis)
                                        : AppStyles.text10PxRegular.whiteColor
                                        .copyWith(
                                        overflow:
                                        TextOverflow.ellipsis)),
                                    onPressed: () async {
                                      context
                                          .read<LoginFormFieldCubit>()
                                          .onUserNameChanged(state
                                          .loginFormEntity
                                          .userName
                                          .value
                                          .isNotNullNotEmpty
                                          ? state.loginFormEntity.userName
                                          .value
                                          : '');
                                      context
                                          .read<LoginFormFieldCubit>()
                                          .onPasswordChanged(state
                                          .loginFormEntity
                                          .password
                                          .value
                                          .isNotNullNotEmpty
                                          ? state.loginFormEntity.password
                                          .value
                                          : '');

                                      if (state.loginFormEntity.userName
                                          .isValid &&
                                          state.loginFormEntity.password
                                              .isValid) {
                                        setState(() {
                                          errorText = '';
                                        });
                                        context.read<SignupCubit>().signup(
                                            loginRequestParam: LoginRequestParams(
                                                email: state
                                                    .loginFormEntity
                                                    .userName
                                                    .value
                                                    .isNotNullNotEmpty
                                                    ? state.loginFormEntity
                                                    .userName.value
                                                    : userNameController.text,
                                                password: state
                                                    .loginFormEntity
                                                    .password
                                                    .value
                                                    .isNotNullNotEmpty
                                                    ? state.loginFormEntity
                                                    .password.value
                                                    : passwordController.text,));
                                      }
                                    },
                                  );
                                },
                              ))
                        ],
                      ).pOnly(bottom: 10.h),
                    ],
                  ).px(
                    context.orientation == Orientation.portrait
                        ? (sizingInformation.deviceScreenType ==
                        DeviceScreenType.tablet
                        ? 70.w
                        : 20.w)
                        : (sizingInformation.deviceScreenType ==
                        DeviceScreenType.tablet
                        ? 80.w
                        : 30.w),
                  ),
                ),
              ],
            );
          }),
        ));
  }
}
