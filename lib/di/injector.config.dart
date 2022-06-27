// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app/app/app_cubit.dart' as _i3;
import '../features/sign_up/sign_up/sign_up_cubit.dart' as _i5;
import '../features/sign_up/tfa_confirm/presentation/tfa_confirm_cubit.dart'
    as _i6;
import '../util/log_util.dart' as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetit(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.AppCubit>(_i3.AppCubit());
  gh.singleton<_i4.LogUtil>(_i4.LogUtil());
  gh.factory<_i5.SignUpCubit>(() => _i5.SignUpCubit());
  gh.factory<_i6.TfaConfirmCubit>(() => _i6.TfaConfirmCubit());
  return get;
}
