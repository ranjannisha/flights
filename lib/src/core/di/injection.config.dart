// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:flight/src/core/di/register_modules.dart' as _i320;
import 'package:flight/src/core/helpers/storage_helper.dart' as _i324;
import 'package:flight/src/core/internet/internet_info.dart' as _i134;
import 'package:flight/src/core/routes/app_router.dart' as _i270;
import 'package:flight/src/features/authentication/data/datasources/login_remote_data_source.dart'
    as _i149;
import 'package:flight/src/features/authentication/data/repositories/login_repository_impl.dart'
    as _i584;
import 'package:flight/src/features/authentication/domain/repositories/login_repository.dart'
    as _i589;
import 'package:flight/src/features/authentication/domain/usecases/login_use_case.dart'
    as _i143;
import 'package:flight/src/features/authentication/domain/usecases/signup_use_case.dart'
    as _i731;
import 'package:flight/src/features/authentication/presentation/bloc/login/form_field/login_form_field_cubit.dart'
    as _i269;
import 'package:flight/src/features/authentication/presentation/bloc/login/login_cubit.dart'
    as _i680;
import 'package:flight/src/features/authentication/presentation/bloc/signup/signup_cubit.dart'
    as _i840;
import 'package:flight/src/features/dashboard/data/datasources/dashboard_remote_data_source.dart'
    as _i529;
import 'package:flight/src/features/dashboard/data/repositories/dashboard_repository_impl.dart'
    as _i209;
import 'package:flight/src/features/dashboard/domain/repositories/dashboard_repository.dart'
    as _i626;
import 'package:flight/src/features/dashboard/domain/usecases/dashboard_usecase.dart'
    as _i989;
import 'package:flight/src/features/dashboard/presentation/bloc/dashboard/dashboard_cubit.dart'
    as _i641;
import 'package:flight/src/features/flights/data/datasources/flight_remote_data_source.dart'
    as _i716;
import 'package:flight/src/features/flights/data/repositories/flight_repository_impl.dart'
    as _i325;
import 'package:flight/src/features/flights/domain/repositories/flight_repository.dart'
    as _i483;
import 'package:flight/src/features/flights/domain/usecase/airline_use_case.dart'
    as _i781;
import 'package:flight/src/features/flights/domain/usecase/flight_use_case.dart'
    as _i648;
import 'package:flight/src/features/flights/presentation/bloc/airline/airline_cubit.dart'
    as _i603;
import 'package:flight/src/features/flights/presentation/bloc/flight/flight_cubit.dart'
    as _i525;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i269.LoginFormFieldCubit>(() => _i269.LoginFormFieldCubit());
    gh.lazySingleton<_i270.AppRouter>(() => registerModule.router);
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i558.FlutterSecureStorage>(() => registerModule.storage);
    gh.lazySingleton<_i324.StorageHelper>(() => registerModule.storageHelper);
    gh.lazySingleton<_i134.InternetInfo>(
        () => _i134.InternetInfoImpl(gh<_i895.Connectivity>()));
    gh.lazySingleton<_i361.Dio>(
      () => registerModule.authenticatedDio,
      instanceName: 'authenticated',
    );
    gh.lazySingleton<_i529.DashboardRemoteDataSource>(
        () => _i529.DashboardRemoteSourceImpl(
              gh<_i361.Dio>(instanceName: 'authenticated'),
              gh<_i324.StorageHelper>(),
            ));
    gh.lazySingleton<_i716.FlightRemoteDataSource>(
        () => _i716.FlightRemoteSourceImpl(
              gh<_i361.Dio>(instanceName: 'authenticated'),
              gh<_i324.StorageHelper>(),
            ));
    gh.lazySingleton<_i149.LoginRemoteDataSource>(
        () => _i149.LoginRemoteSourceImpl(
              gh<_i361.Dio>(instanceName: 'authenticated'),
              gh<_i324.StorageHelper>(),
            ));
    gh.lazySingleton<_i589.LoginRepository>(() => _i584.LoginRepositoryImp(
          gh<_i149.LoginRemoteDataSource>(),
          gh<_i134.InternetInfo>(),
        ));
    gh.lazySingleton<_i483.FlightRepository>(() => _i325.FlightRepositoryImp(
          gh<_i716.FlightRemoteDataSource>(),
          gh<_i134.InternetInfo>(),
        ));
    gh.lazySingleton<_i626.DashboardRepository>(
        () => _i209.DashboardRepositoryImp(
              gh<_i529.DashboardRemoteDataSource>(),
              gh<_i134.InternetInfo>(),
            ));
    gh.lazySingleton<_i143.LoginUseCase>(
        () => _i143.LoginUseCase(gh<_i589.LoginRepository>()));
    gh.lazySingleton<_i731.SignUpUseCase>(
        () => _i731.SignUpUseCase(gh<_i589.LoginRepository>()));
    gh.factory<_i680.LoginCubit>(
        () => _i680.LoginCubit(gh<_i143.LoginUseCase>()));
    gh.lazySingleton<_i648.FlightUseCase>(
        () => _i648.FlightUseCase(gh<_i483.FlightRepository>()));
    gh.lazySingleton<_i781.AirlineUseCase>(
        () => _i781.AirlineUseCase(gh<_i483.FlightRepository>()));
    gh.lazySingleton<_i989.DashboardUseCase>(
        () => _i989.DashboardUseCase(gh<_i626.DashboardRepository>()));
    gh.factory<_i840.SignupCubit>(
        () => _i840.SignupCubit(gh<_i731.SignUpUseCase>()));
    gh.factory<_i641.DashboardCubit>(
        () => _i641.DashboardCubit(gh<_i989.DashboardUseCase>()));
    gh.factory<_i603.AirlineCubit>(
        () => _i603.AirlineCubit(gh<_i781.AirlineUseCase>()));
    gh.factory<_i525.FlightCubit>(
        () => _i525.FlightCubit(gh<_i648.FlightUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i320.RegisterModule {}
