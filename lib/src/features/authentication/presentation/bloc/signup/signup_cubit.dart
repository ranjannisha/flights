import 'package:bloc/bloc.dart';
import 'package:flight/src/core/services/response/api_response.dart';
import 'package:flight/src/features/authentication/data/models/request/login_request_params.dart';
import 'package:flight/src/features/authentication/data/models/response/login_response_model.dart';
import 'package:flight/src/features/authentication/domain/usecases/signup_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'signup_state.dart';
part 'signup_cubit.freezed.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._useCase) : super(const SignupState.initial());

  final SignUpUseCase _useCase;

  void signup({required LoginRequestParams loginRequestParam}) async {
    emit(const SignupState.loading());
    emit(
      (await _useCase.execute(loginRequestParam)).fold(
            (error) => error.when(
            serverError: (serverError) =>
                SignupState.error(message: serverError),
            noInternet: () => const SignupState.noInternet()),
            (data) => SignupState.success(loginResponseModel: data),
      ),
    );
  }
}
