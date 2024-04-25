// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i18;
import 'package:flutter/material.dart' as _i19;
import 'package:game_keeper/modules/auth/ui/screens/auth_screen.dart' as _i2;
import 'package:game_keeper/modules/auth/ui/screens/demo_screen.dart' as _i3;
import 'package:game_keeper/modules/auth/ui/screens/register_email_screen.dart'
    as _i14;
import 'package:game_keeper/modules/auth/ui/screens/restore_pass_screen.dart'
    as _i15;
import 'package:game_keeper/modules/games/game_view/ui/screens/game_achievements_list_screen.dart'
    as _i6;
import 'package:game_keeper/modules/games/game_view/ui/screens/game_developer_info_screen.dart'
    as _i7;
import 'package:game_keeper/modules/games/game_view/ui/screens/game_view_screen.dart'
    as _i8;
import 'package:game_keeper/modules/games/game_view/ui/screens/more_games_screen.dart'
    as _i11;
import 'package:game_keeper/modules/games/game_view/ui/screens/reddit_comments_list_screen.dart'
    as _i13;
import 'package:game_keeper/modules/games/navbar_games/ui/screens/full_search_screen.dart'
    as _i4;
import 'package:game_keeper/modules/games/navbar_games/ui/screens/games_screen.dart'
    as _i9;
import 'package:game_keeper/modules/home/logic/api/model/games_list_model.dart'
    as _i21;
import 'package:game_keeper/modules/home/logic/bloc/home_bloc.dart' as _i22;
import 'package:game_keeper/modules/home/ui/screens/home_screen.dart' as _i10;
import 'package:game_keeper/modules/home/ui/screens/test_screen.dart' as _i17;
import 'package:game_keeper/modules/profile/ui/screens/profile_screen.dart'
    as _i12;
import 'package:game_keeper/modules/profile/ui/screens/settings_screen.dart'
    as _i1;
import 'package:game_keeper/modules/splash/ui/splash_screen.dart' as _i16;
import 'package:game_keeper/ui/widgets/gk_appbar.dart' as _i20;
import 'package:game_keeper/ui/widgets/gk_navbar.dart' as _i5;

abstract class $AppRouter extends _i18.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i18.PageFactory> pagesMap = {
    ApplicationPreferences.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ApplicationPreferences(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(child: const _i2.AuthScreen()),
      );
    },
    DemoRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DemoScreen(),
      );
    },
    FullSearchRoute.name: (routeData) {
      final args = routeData.argsAs<FullSearchRouteArgs>();
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(
            child: _i4.FullSearchScreen(
          key: args.key,
          query: args.query,
        )),
      );
    },
    GKNavBar.name: (routeData) {
      final args =
          routeData.argsAs<GKNavBarArgs>(orElse: () => const GKNavBarArgs());
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.GKNavBar(
          key: args.key,
          appBar: args.appBar,
          body: args.body,
          floatingActionButton: args.floatingActionButton,
        ),
      );
    },
    GameAchivementsListRoute.name: (routeData) {
      final args = routeData.argsAs<GameAchivementsListRouteArgs>();
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(
            child: _i6.GameAchivementsListScreen(
          key: args.key,
          gameId: args.gameId,
          gameName: args.gameName,
        )),
      );
    },
    GameDeveloperInfoRoute.name: (routeData) {
      final args = routeData.argsAs<GameDeveloperInfoRouteArgs>();
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(
            child: _i7.GameDeveloperInfoScreen(
          key: args.key,
          developerId: args.developerId,
          developerName: args.developerName,
        )),
      );
    },
    GameViewRoute.name: (routeData) {
      final args = routeData.argsAs<GameViewRouteArgs>();
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(
            child: _i8.GameViewScreen(
          key: args.key,
          gameId: args.gameId,
        )),
      );
    },
    GamesRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.GamesScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(child: const _i10.HomeScreen()),
      );
    },
    MoreGamesRoute.name: (routeData) {
      final args = routeData.argsAs<MoreGamesRouteArgs>();
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(
            child: _i11.MoreGamesScreen(
          key: args.key,
          gamesListModel: args.gamesListModel,
          eventProvider: args.eventProvider,
        )),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.ProfileScreen(),
      );
    },
    RedditCommentsListRoute.name: (routeData) {
      final args = routeData.argsAs<RedditCommentsListRouteArgs>();
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(
            child: _i13.RedditCommentsListScreen(
          key: args.key,
          gameId: args.gameId,
          gameName: args.gameName,
        )),
      );
    },
    RegisterEmailRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(child: const _i14.RegisterEmailScreen()),
      );
    },
    RestorePassRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(child: const _i15.RestorePassScreen()),
      );
    },
    SplashRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.SplashScreen(),
      );
    },
    TestedRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.TestedScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.ApplicationPreferences]
class ApplicationPreferences extends _i18.PageRouteInfo<void> {
  const ApplicationPreferences({List<_i18.PageRouteInfo>? children})
      : super(
          ApplicationPreferences.name,
          initialChildren: children,
        );

  static const String name = 'ApplicationPreferences';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AuthScreen]
class AuthRoute extends _i18.PageRouteInfo<void> {
  const AuthRoute({List<_i18.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DemoScreen]
class DemoRoute extends _i18.PageRouteInfo<void> {
  const DemoRoute({List<_i18.PageRouteInfo>? children})
      : super(
          DemoRoute.name,
          initialChildren: children,
        );

  static const String name = 'DemoRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i4.FullSearchScreen]
class FullSearchRoute extends _i18.PageRouteInfo<FullSearchRouteArgs> {
  FullSearchRoute({
    _i19.Key? key,
    required String query,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          FullSearchRoute.name,
          args: FullSearchRouteArgs(
            key: key,
            query: query,
          ),
          initialChildren: children,
        );

  static const String name = 'FullSearchRoute';

  static const _i18.PageInfo<FullSearchRouteArgs> page =
      _i18.PageInfo<FullSearchRouteArgs>(name);
}

class FullSearchRouteArgs {
  const FullSearchRouteArgs({
    this.key,
    required this.query,
  });

  final _i19.Key? key;

  final String query;

  @override
  String toString() {
    return 'FullSearchRouteArgs{key: $key, query: $query}';
  }
}

/// generated route for
/// [_i5.GKNavBar]
class GKNavBar extends _i18.PageRouteInfo<GKNavBarArgs> {
  GKNavBar({
    _i19.Key? key,
    _i20.GKAppBar? appBar,
    _i19.Widget? body,
    _i19.FloatingActionButton? floatingActionButton,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          GKNavBar.name,
          args: GKNavBarArgs(
            key: key,
            appBar: appBar,
            body: body,
            floatingActionButton: floatingActionButton,
          ),
          initialChildren: children,
        );

  static const String name = 'GKNavBar';

  static const _i18.PageInfo<GKNavBarArgs> page =
      _i18.PageInfo<GKNavBarArgs>(name);
}

class GKNavBarArgs {
  const GKNavBarArgs({
    this.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
  });

  final _i19.Key? key;

  final _i20.GKAppBar? appBar;

  final _i19.Widget? body;

  final _i19.FloatingActionButton? floatingActionButton;

  @override
  String toString() {
    return 'GKNavBarArgs{key: $key, appBar: $appBar, body: $body, floatingActionButton: $floatingActionButton}';
  }
}

/// generated route for
/// [_i6.GameAchivementsListScreen]
class GameAchivementsListRoute
    extends _i18.PageRouteInfo<GameAchivementsListRouteArgs> {
  GameAchivementsListRoute({
    _i19.Key? key,
    required int gameId,
    required String gameName,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          GameAchivementsListRoute.name,
          args: GameAchivementsListRouteArgs(
            key: key,
            gameId: gameId,
            gameName: gameName,
          ),
          initialChildren: children,
        );

  static const String name = 'GameAchivementsListRoute';

  static const _i18.PageInfo<GameAchivementsListRouteArgs> page =
      _i18.PageInfo<GameAchivementsListRouteArgs>(name);
}

class GameAchivementsListRouteArgs {
  const GameAchivementsListRouteArgs({
    this.key,
    required this.gameId,
    required this.gameName,
  });

  final _i19.Key? key;

  final int gameId;

  final String gameName;

  @override
  String toString() {
    return 'GameAchivementsListRouteArgs{key: $key, gameId: $gameId, gameName: $gameName}';
  }
}

/// generated route for
/// [_i7.GameDeveloperInfoScreen]
class GameDeveloperInfoRoute
    extends _i18.PageRouteInfo<GameDeveloperInfoRouteArgs> {
  GameDeveloperInfoRoute({
    _i19.Key? key,
    required int developerId,
    required String developerName,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          GameDeveloperInfoRoute.name,
          args: GameDeveloperInfoRouteArgs(
            key: key,
            developerId: developerId,
            developerName: developerName,
          ),
          initialChildren: children,
        );

  static const String name = 'GameDeveloperInfoRoute';

  static const _i18.PageInfo<GameDeveloperInfoRouteArgs> page =
      _i18.PageInfo<GameDeveloperInfoRouteArgs>(name);
}

class GameDeveloperInfoRouteArgs {
  const GameDeveloperInfoRouteArgs({
    this.key,
    required this.developerId,
    required this.developerName,
  });

  final _i19.Key? key;

  final int developerId;

  final String developerName;

  @override
  String toString() {
    return 'GameDeveloperInfoRouteArgs{key: $key, developerId: $developerId, developerName: $developerName}';
  }
}

/// generated route for
/// [_i8.GameViewScreen]
class GameViewRoute extends _i18.PageRouteInfo<GameViewRouteArgs> {
  GameViewRoute({
    _i19.Key? key,
    required int gameId,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          GameViewRoute.name,
          args: GameViewRouteArgs(
            key: key,
            gameId: gameId,
          ),
          initialChildren: children,
        );

  static const String name = 'GameViewRoute';

  static const _i18.PageInfo<GameViewRouteArgs> page =
      _i18.PageInfo<GameViewRouteArgs>(name);
}

class GameViewRouteArgs {
  const GameViewRouteArgs({
    this.key,
    required this.gameId,
  });

  final _i19.Key? key;

  final int gameId;

  @override
  String toString() {
    return 'GameViewRouteArgs{key: $key, gameId: $gameId}';
  }
}

/// generated route for
/// [_i9.GamesScreen]
class GamesRoute extends _i18.PageRouteInfo<void> {
  const GamesRoute({List<_i18.PageRouteInfo>? children})
      : super(
          GamesRoute.name,
          initialChildren: children,
        );

  static const String name = 'GamesRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i10.HomeScreen]
class HomeRoute extends _i18.PageRouteInfo<void> {
  const HomeRoute({List<_i18.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i11.MoreGamesScreen]
class MoreGamesRoute extends _i18.PageRouteInfo<MoreGamesRouteArgs> {
  MoreGamesRoute({
    _i19.Key? key,
    required _i21.GamesListModel gamesListModel,
    required _i22.HomeEvent Function(
      int,
      int,
    ) eventProvider,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          MoreGamesRoute.name,
          args: MoreGamesRouteArgs(
            key: key,
            gamesListModel: gamesListModel,
            eventProvider: eventProvider,
          ),
          initialChildren: children,
        );

  static const String name = 'MoreGamesRoute';

  static const _i18.PageInfo<MoreGamesRouteArgs> page =
      _i18.PageInfo<MoreGamesRouteArgs>(name);
}

class MoreGamesRouteArgs {
  const MoreGamesRouteArgs({
    this.key,
    required this.gamesListModel,
    required this.eventProvider,
  });

  final _i19.Key? key;

  final _i21.GamesListModel gamesListModel;

  final _i22.HomeEvent Function(
    int,
    int,
  ) eventProvider;

  @override
  String toString() {
    return 'MoreGamesRouteArgs{key: $key, gamesListModel: $gamesListModel, eventProvider: $eventProvider}';
  }
}

/// generated route for
/// [_i12.ProfileScreen]
class ProfileRoute extends _i18.PageRouteInfo<void> {
  const ProfileRoute({List<_i18.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i13.RedditCommentsListScreen]
class RedditCommentsListRoute
    extends _i18.PageRouteInfo<RedditCommentsListRouteArgs> {
  RedditCommentsListRoute({
    _i19.Key? key,
    required int gameId,
    required String gameName,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          RedditCommentsListRoute.name,
          args: RedditCommentsListRouteArgs(
            key: key,
            gameId: gameId,
            gameName: gameName,
          ),
          initialChildren: children,
        );

  static const String name = 'RedditCommentsListRoute';

  static const _i18.PageInfo<RedditCommentsListRouteArgs> page =
      _i18.PageInfo<RedditCommentsListRouteArgs>(name);
}

class RedditCommentsListRouteArgs {
  const RedditCommentsListRouteArgs({
    this.key,
    required this.gameId,
    required this.gameName,
  });

  final _i19.Key? key;

  final int gameId;

  final String gameName;

  @override
  String toString() {
    return 'RedditCommentsListRouteArgs{key: $key, gameId: $gameId, gameName: $gameName}';
  }
}

/// generated route for
/// [_i14.RegisterEmailScreen]
class RegisterEmailRoute extends _i18.PageRouteInfo<void> {
  const RegisterEmailRoute({List<_i18.PageRouteInfo>? children})
      : super(
          RegisterEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterEmailRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i15.RestorePassScreen]
class RestorePassRoute extends _i18.PageRouteInfo<void> {
  const RestorePassRoute({List<_i18.PageRouteInfo>? children})
      : super(
          RestorePassRoute.name,
          initialChildren: children,
        );

  static const String name = 'RestorePassRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i16.SplashScreen]
class SplashRoute extends _i18.PageRouteInfo<void> {
  const SplashRoute({List<_i18.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i17.TestedScreen]
class TestedRoute extends _i18.PageRouteInfo<void> {
  const TestedRoute({List<_i18.PageRouteInfo>? children})
      : super(
          TestedRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestedRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}
