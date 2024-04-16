// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;
import 'package:game_keeper/modules/auth/ui/screens/auth_screen.dart' as _i2;
import 'package:game_keeper/modules/auth/ui/screens/demo_screen.dart' as _i3;
import 'package:game_keeper/modules/auth/ui/screens/register_email_screen.dart'
    as _i10;
import 'package:game_keeper/modules/auth/ui/screens/restore_pass_screen.dart'
    as _i11;
import 'package:game_keeper/modules/game_view/ui/screens/game_view_screen.dart'
    as _i5;
import 'package:game_keeper/modules/game_view/ui/screens/more_games_screen.dart'
    as _i7;
import 'package:game_keeper/modules/game_view/ui/screens/reddit_comments_list_screen.dart'
    as _i9;
import 'package:game_keeper/modules/home/logic/api/model/games_list_model.dart'
    as _i17;
import 'package:game_keeper/modules/home/logic/bloc/home_bloc.dart' as _i18;
import 'package:game_keeper/modules/home/ui/screens/home_screen.dart' as _i6;
import 'package:game_keeper/modules/home/ui/screens/test_screen.dart' as _i13;
import 'package:game_keeper/modules/profile/ui/screens/profile_screen.dart'
    as _i8;
import 'package:game_keeper/modules/profile/ui/screens/settings_screen.dart'
    as _i1;
import 'package:game_keeper/modules/splash/ui/splash_screen.dart' as _i12;
import 'package:game_keeper/ui/widgets/gk_appbar.dart' as _i16;
import 'package:game_keeper/ui/widgets/gk_navbar.dart' as _i4;

abstract class $AppRouter extends _i14.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    ApplicationPreferences.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ApplicationPreferences(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.WrappedRoute(child: const _i2.AuthScreen()),
      );
    },
    DemoRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DemoScreen(),
      );
    },
    GKNavBar.name: (routeData) {
      final args =
          routeData.argsAs<GKNavBarArgs>(orElse: () => const GKNavBarArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.GKNavBar(
          key: args.key,
          appBar: args.appBar,
          body: args.body,
          floatingActionButton: args.floatingActionButton,
        ),
      );
    },
    GameViewRoute.name: (routeData) {
      final args = routeData.argsAs<GameViewRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.WrappedRoute(
            child: _i5.GameViewScreen(
          key: args.key,
          gameId: args.gameId,
        )),
      );
    },
    HomeRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.WrappedRoute(child: const _i6.HomeScreen()),
      );
    },
    MoreGamesRoute.name: (routeData) {
      final args = routeData.argsAs<MoreGamesRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.WrappedRoute(
            child: _i7.MoreGamesScreen(
          key: args.key,
          gamesListModel: args.gamesListModel,
          eventProvider: args.eventProvider,
        )),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ProfileScreen(),
      );
    },
    RedditCommentsListRoute.name: (routeData) {
      final args = routeData.argsAs<RedditCommentsListRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.WrappedRoute(
            child: _i9.RedditCommentsListScreen(
          key: args.key,
          gameId: args.gameId,
          gameName: args.gameName,
        )),
      );
    },
    RegisterEmailRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.WrappedRoute(child: const _i10.RegisterEmailScreen()),
      );
    },
    RestorePassRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.WrappedRoute(child: const _i11.RestorePassScreen()),
      );
    },
    SplashRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SplashScreen(),
      );
    },
    TestedRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.TestedScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.ApplicationPreferences]
class ApplicationPreferences extends _i14.PageRouteInfo<void> {
  const ApplicationPreferences({List<_i14.PageRouteInfo>? children})
      : super(
          ApplicationPreferences.name,
          initialChildren: children,
        );

  static const String name = 'ApplicationPreferences';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AuthScreen]
class AuthRoute extends _i14.PageRouteInfo<void> {
  const AuthRoute({List<_i14.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DemoScreen]
class DemoRoute extends _i14.PageRouteInfo<void> {
  const DemoRoute({List<_i14.PageRouteInfo>? children})
      : super(
          DemoRoute.name,
          initialChildren: children,
        );

  static const String name = 'DemoRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i4.GKNavBar]
class GKNavBar extends _i14.PageRouteInfo<GKNavBarArgs> {
  GKNavBar({
    _i15.Key? key,
    _i16.GKAppBar? appBar,
    _i15.Widget? body,
    _i15.FloatingActionButton? floatingActionButton,
    List<_i14.PageRouteInfo>? children,
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

  static const _i14.PageInfo<GKNavBarArgs> page =
      _i14.PageInfo<GKNavBarArgs>(name);
}

class GKNavBarArgs {
  const GKNavBarArgs({
    this.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
  });

  final _i15.Key? key;

  final _i16.GKAppBar? appBar;

  final _i15.Widget? body;

  final _i15.FloatingActionButton? floatingActionButton;

  @override
  String toString() {
    return 'GKNavBarArgs{key: $key, appBar: $appBar, body: $body, floatingActionButton: $floatingActionButton}';
  }
}

/// generated route for
/// [_i5.GameViewScreen]
class GameViewRoute extends _i14.PageRouteInfo<GameViewRouteArgs> {
  GameViewRoute({
    _i15.Key? key,
    required int gameId,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          GameViewRoute.name,
          args: GameViewRouteArgs(
            key: key,
            gameId: gameId,
          ),
          initialChildren: children,
        );

  static const String name = 'GameViewRoute';

  static const _i14.PageInfo<GameViewRouteArgs> page =
      _i14.PageInfo<GameViewRouteArgs>(name);
}

class GameViewRouteArgs {
  const GameViewRouteArgs({
    this.key,
    required this.gameId,
  });

  final _i15.Key? key;

  final int gameId;

  @override
  String toString() {
    return 'GameViewRouteArgs{key: $key, gameId: $gameId}';
  }
}

/// generated route for
/// [_i6.HomeScreen]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute({List<_i14.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MoreGamesScreen]
class MoreGamesRoute extends _i14.PageRouteInfo<MoreGamesRouteArgs> {
  MoreGamesRoute({
    _i15.Key? key,
    required _i17.GamesListModel gamesListModel,
    required _i18.HomeEvent Function(
      int,
      int,
    ) eventProvider,
    List<_i14.PageRouteInfo>? children,
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

  static const _i14.PageInfo<MoreGamesRouteArgs> page =
      _i14.PageInfo<MoreGamesRouteArgs>(name);
}

class MoreGamesRouteArgs {
  const MoreGamesRouteArgs({
    this.key,
    required this.gamesListModel,
    required this.eventProvider,
  });

  final _i15.Key? key;

  final _i17.GamesListModel gamesListModel;

  final _i18.HomeEvent Function(
    int,
    int,
  ) eventProvider;

  @override
  String toString() {
    return 'MoreGamesRouteArgs{key: $key, gamesListModel: $gamesListModel, eventProvider: $eventProvider}';
  }
}

/// generated route for
/// [_i8.ProfileScreen]
class ProfileRoute extends _i14.PageRouteInfo<void> {
  const ProfileRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i9.RedditCommentsListScreen]
class RedditCommentsListRoute
    extends _i14.PageRouteInfo<RedditCommentsListRouteArgs> {
  RedditCommentsListRoute({
    _i15.Key? key,
    required int gameId,
    required String gameName,
    List<_i14.PageRouteInfo>? children,
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

  static const _i14.PageInfo<RedditCommentsListRouteArgs> page =
      _i14.PageInfo<RedditCommentsListRouteArgs>(name);
}

class RedditCommentsListRouteArgs {
  const RedditCommentsListRouteArgs({
    this.key,
    required this.gameId,
    required this.gameName,
  });

  final _i15.Key? key;

  final int gameId;

  final String gameName;

  @override
  String toString() {
    return 'RedditCommentsListRouteArgs{key: $key, gameId: $gameId, gameName: $gameName}';
  }
}

/// generated route for
/// [_i10.RegisterEmailScreen]
class RegisterEmailRoute extends _i14.PageRouteInfo<void> {
  const RegisterEmailRoute({List<_i14.PageRouteInfo>? children})
      : super(
          RegisterEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterEmailRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i11.RestorePassScreen]
class RestorePassRoute extends _i14.PageRouteInfo<void> {
  const RestorePassRoute({List<_i14.PageRouteInfo>? children})
      : super(
          RestorePassRoute.name,
          initialChildren: children,
        );

  static const String name = 'RestorePassRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SplashScreen]
class SplashRoute extends _i14.PageRouteInfo<void> {
  const SplashRoute({List<_i14.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i13.TestedScreen]
class TestedRoute extends _i14.PageRouteInfo<void> {
  const TestedRoute({List<_i14.PageRouteInfo>? children})
      : super(
          TestedRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestedRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}
