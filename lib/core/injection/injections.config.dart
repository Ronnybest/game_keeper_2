// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:game_keeper/core/constants/constants.dart' as _i6;
import 'package:game_keeper/core/utils/clear_all_data.dart' as _i5;
import 'package:game_keeper/core/utils/fast_cached_image.dart' as _i7;
import 'package:game_keeper/core/utils/shared_prefs.dart' as _i9;
import 'package:game_keeper/modules/auth/logic/bloc/auth_bloc.dart' as _i3;
import 'package:game_keeper/modules/auth/logic/utils/auth_google.dart' as _i4;
import 'package:game_keeper/modules/auth/logic/utils/login_methods_list.dart'
    as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AuthBloc>(() => _i3.AuthBloc());
    gh.lazySingleton<_i4.AuthGoogle>(() => _i4.AuthGoogle());
    gh.lazySingleton<_i5.ClearAllData>(() => _i5.ClearAllData());
    gh.lazySingleton<_i6.DemoScreenConstants>(() => _i6.DemoScreenConstants());
    gh.lazySingleton<_i7.FastCachedNetworkInit>(
        () => _i7.FastCachedNetworkInit());
    gh.lazySingleton<_i8.LoginMethodsList>(() => _i8.LoginMethodsList());
    gh.lazySingleton<_i9.SharedPrefencesUtil>(() => _i9.SharedPrefencesUtil());
    gh.lazySingleton<_i6.Validators>(() => _i6.Validators());
    return this;
  }
}
