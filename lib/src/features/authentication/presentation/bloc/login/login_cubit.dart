import 'package:bloc/bloc.dart';
import 'package:flight/src/features/authentication/data/models/request/login_request_params.dart';
import 'package:flight/src/features/authentication/domain/usecases/login_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flight/src/core/services/response/api_response.dart';
import 'package:flight/src/features/authentication/data/models/response/login_response_model.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

/// A Cubit responsible for managing the login state and business logic.
///
/// This Cubit handles user authentication by interacting with the [LoginUseCase].
@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._useCase) : super(const LoginState.initial());

  final LoginUseCase _useCase;

  void login({required LoginRequestParams loginRequestParam}) async {
    emit(const LoginState.loading());
    emit(
      (await _useCase.execute(loginRequestParam)).fold(
        (error) => error.when(
            serverError: (serverError) =>
                LoginState.error(message: serverError),
            noInternet: () => const LoginState.noInternet()),
        (data) => LoginState.success(loginResponseModel: data),
      ),
    );
  }
}
