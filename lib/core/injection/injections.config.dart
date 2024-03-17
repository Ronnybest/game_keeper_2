// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:game_keeper/core/constants/constants.dart' as _i4;
import 'package:game_keeper/core/utils/shared_prefs.dart' as _i5;
import 'package:game_keeper/modules/auth/logic/utils/auth_google.dart' as _i3;
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
    gh.lazySingleton<_i3.AuthGoogle>(() => _i3.AuthGoogle());
    gh.lazySingleton<_i4.DemoScreenConstants>(() => _i4.DemoScreenConstants());
    gh.lazySingleton<_i5.SharedPrefencesUtil>(() => _i5.SharedPrefencesUtil());
    gh.lazySingleton<_i4.Validators>(() => _i4.Validators());
    return this;
  }
}
