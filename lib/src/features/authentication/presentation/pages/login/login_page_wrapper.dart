import 'package:flight/src/core/di/injection.dart';
import 'package:flight/src/features/authentication/presentation/bloc/login/form_field/login_form_field_cubit.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoginPageWrapper extends StatelessWidget {
  const LoginPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    return BlocProvider(
      lazy: false,
      create: (context) => getIt<LoginFormFieldCubit>(),
      child: const AutoRouter(),
    );
  }
}
