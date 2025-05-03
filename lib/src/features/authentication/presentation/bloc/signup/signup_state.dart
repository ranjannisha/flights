part of 'signup_cubit.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState.initial() = _Initial;

  const factory SignupState.loading() = _Loading;

  const factory SignupState.noInternet() = _NoInternet;

  const factory SignupState.error({required String message}) = _Error;

  const factory SignupState.success(
      {required ApiResponse<LoginResponseModel> loginResponseModel}) = _Success;
}