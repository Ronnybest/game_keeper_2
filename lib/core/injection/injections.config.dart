// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:game_keeper/core/constants/constants.dart' as _i5;
import 'package:game_keeper/core/network/core_api.dart' as _i14;
import 'package:game_keeper/core/network/core_config.dart' as _i13;
import 'package:game_keeper/core/utils/clear_all_data.dart' as _i6;
import 'package:game_keeper/core/utils/exception_worker.dart' as _i7;
import 'package:game_keeper/core/utils/fast_cached_image.dart' as _i8;
import 'package:game_keeper/core/utils/logger_init.dart' as _i4;
import 'package:game_keeper/core/utils/shared_prefs.dart' as _i9;
import 'package:game_keeper/core/utils/user_info_firestore.dart' as _i10;
import 'package:game_keeper/modules/auth/logic/bloc/auth_bloc.dart' as _i3;
import 'package:game_keeper/modules/auth/logic/utils/auth_google.dart' as _i11;
import 'package:game_keeper/modules/auth/logic/utils/login_methods_list.dart'
    as _i12;
import 'package:game_keeper/modules/games/game_view/logic/api/provider/game_view_provider.dart'
    as _i15;
import 'package:game_keeper/modules/games/game_view/logic/api/repository/game_view_repository.dart'
    as _i23;
import 'package:game_keeper/modules/games/game_view/logic/api/repository/implementation/game_view_repository_impl.dart'
    as _i24;
import 'package:game_keeper/modules/games/game_view/logic/bloc/game_view_bloc.dart'
    as _i26;
import 'package:game_keeper/modules/games/navbar_games/logic/api/provider/games_provider.dart'
    as _i16;
import 'package:game_keeper/modules/games/navbar_games/logic/api/repository/games_repository.dart'
    as _i18;
import 'package:game_keeper/modules/games/navbar_games/logic/api/repository/implementation/games_repository_implementation.dart'
    as _i19;
import 'package:game_keeper/modules/games/navbar_games/logic/bloc/games_bloc.dart'
    as _i22;
import 'package:game_keeper/modules/home/logic/api/provider/home_provider.dart'
    as _i17;
import 'package:game_keeper/modules/home/logic/api/repository/home_repository.dart'
    as _i20;
import 'package:game_keeper/modules/home/logic/api/repository/implementation/home_repository_impl.dart'
    as _i21;
import 'package:game_keeper/modules/home/logic/bloc/home_bloc.dart' as _i25;
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
    gh.factory<_i3.AuthBloc>(() => _i3.AuthBloc());
    gh.singleton<_i4.AppLogger>(() => _i4.AppLogger());
    gh.lazySingleton<_i5.DemoScreenConstants>(() => _i5.DemoScreenConstants());
    gh.lazySingleton<_i5.Validators>(() => _i5.Validators());
    gh.lazySingleton<_i6.ClearAllData>(() => _i6.ClearAllData());
    gh.lazySingleton<_i7.ExceptionWorker>(() => _i7.ExceptionWorker());
    gh.lazySingleton<_i8.FastCachedNetworkInit>(
        () => _i8.FastCachedNetworkInit());
    gh.lazySingleton<_i9.SharedPrefencesUtil>(() => _i9.SharedPrefencesUtil());
    gh.lazySingleton<_i10.UserInfoFirestore>(() => _i10.UserInfoFirestore());
    gh.lazySingleton<_i11.AuthGoogle>(() => _i11.AuthGoogle());
    gh.lazySingleton<_i12.LoginMethodsList>(() => _i12.LoginMethodsList());
    gh.singleton<String>(
      () => appModule.baseRawgIoUrl,
      instanceName: 'baseRawgIoUrl',
    );
    gh.singleton<String>(
      () => appModule.baseNewsUrl,
      instanceName: 'baseNewsUrl',
    );
    gh.singleton<_i13.CoreConfig>(() => _i13.CoreConfig(
          gh<String>(instanceName: 'baseRawgIoUrl'),
          gh<String>(instanceName: 'baseNewsUrl'),
        ));
    gh.singleton<_i14.CoreApi>(() => _i14.CoreApi(gh<_i13.CoreConfig>()));
    gh.lazySingleton<_i15.GameViewProvider>(
        () => _i15.GameViewProvider(gh<_i14.CoreApi>()));
    gh.lazySingleton<_i16.GamesProvider>(
        () => _i16.GamesProvider(gh<_i14.CoreApi>()));
    gh.lazySingleton<_i17.HomeProvider>(
        () => _i17.HomeProvider(gh<_i14.CoreApi>()));
    gh.lazySingleton<_i18.GamesRepository>(() =>
        _i19.GamesRepositoryImplementation(
            gamesProvider: gh<_i16.GamesProvider>()));
    gh.lazySingleton<_i20.HomeRepository>(
        () => _i21.HomeRepositoryImpl(gh<_i17.HomeProvider>()));
    gh.factory<_i22.GamesBloc>(
        () => _i22.GamesBloc(gh<_i18.GamesRepository>()));
    gh.lazySingleton<_i23.GameViewRepository>(
        () => _i24.GameViewRepositoryImpl(gh<_i15.GameViewProvider>()));
    gh.factory<_i25.HomeBloc>(() => _i25.HomeBloc(gh<_i20.HomeRepository>()));
    gh.factory<_i26.GameViewBloc>(
        () => _i26.GameViewBloc(gh<_i23.GameViewRepository>()));
    return this;
  }
}

class _$AppModule extends _i14.AppModule {}
