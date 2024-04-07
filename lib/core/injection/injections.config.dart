// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:game_keeper/core/constants/constants.dart' as _i7;
import 'package:game_keeper/core/network/core_api.dart' as _i14;
import 'package:game_keeper/core/network/core_config.dart' as _i13;
import 'package:game_keeper/core/utils/clear_all_data.dart' as _i6;
import 'package:game_keeper/core/utils/exception_worker.dart' as _i8;
import 'package:game_keeper/core/utils/fast_cached_image.dart' as _i9;
import 'package:game_keeper/core/utils/logger_init.dart' as _i3;
import 'package:game_keeper/core/utils/shared_prefs.dart' as _i11;
import 'package:game_keeper/core/utils/user_info_firestore.dart' as _i12;
import 'package:game_keeper/modules/auth/logic/bloc/auth_bloc.dart' as _i4;
import 'package:game_keeper/modules/auth/logic/utils/auth_google.dart' as _i5;
import 'package:game_keeper/modules/auth/logic/utils/login_methods_list.dart'
    as _i10;
import 'package:game_keeper/modules/game_view/logic/api/provider/game_provider.dart'
    as _i15;
import 'package:game_keeper/modules/game_view/logic/api/repository/game_repository.dart'
    as _i16;
import 'package:game_keeper/modules/game_view/logic/api/repository/implementation/game_repository_impl.dart'
    as _i17;
import 'package:game_keeper/modules/game_view/logic/bloc/game_view_bloc.dart'
    as _i18;
import 'package:game_keeper/modules/home/logic/api/provider/home_provider.dart'
    as _i19;
import 'package:game_keeper/modules/home/logic/api/repository/home_repository.dart'
    as _i20;
import 'package:game_keeper/modules/home/logic/api/repository/implementation/home_repository_impl.dart'
    as _i21;
import 'package:game_keeper/modules/home/logic/bloc/home_bloc.dart' as _i22;
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
    gh.lazySingleton<_i8.ExceptionWorker>(() => _i8.ExceptionWorker());
    gh.lazySingleton<_i9.FastCachedNetworkInit>(
        () => _i9.FastCachedNetworkInit());
    gh.lazySingleton<_i10.LoginMethodsList>(() => _i10.LoginMethodsList());
    gh.lazySingleton<_i11.SharedPrefencesUtil>(
        () => _i11.SharedPrefencesUtil());
    gh.singleton<String>(
      () => appModule.baseRawgIoUrl,
      instanceName: 'baseRawgIoUrl',
    );
    gh.singleton<String>(
      () => appModule.baseNewsUrl,
      instanceName: 'baseNewsUrl',
    );
    gh.lazySingleton<_i12.UserInfoFirestore>(() => _i12.UserInfoFirestore());
    gh.lazySingleton<_i7.Validators>(() => _i7.Validators());
    gh.singleton<_i13.CoreConfig>(() => _i13.CoreConfig(
          gh<String>(instanceName: 'baseRawgIoUrl'),
          gh<String>(instanceName: 'baseNewsUrl'),
        ));
    gh.singleton<_i14.CoreApi>(() => _i14.CoreApi(gh<_i13.CoreConfig>()));
    gh.lazySingleton<_i15.GameProvider>(
        () => _i15.GameProvider(gh<_i14.CoreApi>()));
    gh.lazySingleton<_i16.GameRepository>(
        () => _i17.GameRepositoryImpl(gh<_i15.GameProvider>()));
    gh.factory<_i18.GameViewBloc>(
        () => _i18.GameViewBloc(gh<_i16.GameRepository>()));
    gh.lazySingleton<_i19.HomeProvider>(
        () => _i19.HomeProvider(gh<_i14.CoreApi>()));
    gh.lazySingleton<_i20.HomeRepository>(
        () => _i21.HomeRepositoryImpl(gh<_i19.HomeProvider>()));
    gh.factory<_i22.HomeBloc>(() => _i22.HomeBloc(gh<_i20.HomeRepository>()));
    return this;
  }
}

class _$AppModule extends _i14.AppModule {}
