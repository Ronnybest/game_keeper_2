// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:game_keeper/core/constants/constants.dart' as _i7;
import 'package:game_keeper/core/network/core_api.dart' as _i12;
import 'package:game_keeper/core/network/core_config.dart' as _i11;
import 'package:game_keeper/core/utils/clear_all_data.dart' as _i6;
import 'package:game_keeper/core/utils/fast_cached_image.dart' as _i8;
import 'package:game_keeper/core/utils/logger_init.dart' as _i3;
import 'package:game_keeper/core/utils/shared_prefs.dart' as _i10;
import 'package:game_keeper/modules/auth/logic/bloc/auth_bloc.dart' as _i4;
import 'package:game_keeper/modules/auth/logic/utils/auth_google.dart' as _i5;
import 'package:game_keeper/modules/auth/logic/utils/login_methods_list.dart'
    as _i9;
import 'package:game_keeper/modules/home/logic/api/provider/home_provider.dart'
    as _i13;
import 'package:game_keeper/modules/home/logic/api/repository/home_repository.dart'
    as _i14;
import 'package:game_keeper/modules/home/logic/api/repository/implementation/home_repository_impl.dart'
    as _i15;
import 'package:game_keeper/modules/home/logic/bloc/home_bloc.dart' as _i16;
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
    final appModule = _$AppModule();
    gh.singleton<_i3.AppLogger>(() => _i3.AppLogger());
    gh.factory<_i4.AuthBloc>(() => _i4.AuthBloc());
    gh.lazySingleton<_i5.AuthGoogle>(() => _i5.AuthGoogle());
    gh.lazySingleton<_i6.ClearAllData>(() => _i6.ClearAllData());
    gh.lazySingleton<_i7.DemoScreenConstants>(() => _i7.DemoScreenConstants());
    gh.lazySingleton<_i8.FastCachedNetworkInit>(
        () => _i8.FastCachedNetworkInit());
    gh.lazySingleton<_i9.LoginMethodsList>(() => _i9.LoginMethodsList());
    gh.lazySingleton<_i10.SharedPrefencesUtil>(
        () => _i10.SharedPrefencesUtil());
    gh.singleton<String>(
      () => appModule.baseRawgIoUrl,
      instanceName: 'baseRawgIoUrl',
    );
    gh.singleton<String>(
      () => appModule.baseNewsUrl,
      instanceName: 'baseNewsUrl',
    );
    gh.lazySingleton<_i7.Validators>(() => _i7.Validators());
    gh.singleton<_i11.CoreConfig>(() => _i11.CoreConfig(
          gh<String>(instanceName: 'baseRawgIoUrl'),
          gh<String>(instanceName: 'baseNewsUrl'),
        ));
    gh.singleton<_i12.CoreApi>(() => _i12.CoreApi(gh<_i11.CoreConfig>()));
    gh.lazySingleton<_i13.HomeProvider>(
        () => _i13.HomeProvider(gh<_i12.CoreApi>()));
    gh.lazySingleton<_i14.HomeRepository>(
        () => _i15.HomeRepositoryImpl(gh<_i13.HomeProvider>()));
    gh.factory<_i16.HomeBloc>(() => _i16.HomeBloc(gh<_i14.HomeRepository>()));
    return this;
  }
}

class _$AppModule extends _i12.AppModule {}
