// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:game_keeper/modules/auth/ui/screens/auth_screen.dart' as _i2;
import 'package:game_keeper/modules/auth/ui/screens/demo_screen.dart' as _i3;
import 'package:game_keeper/modules/auth/ui/screens/register_email_screen.dart'
    as _i8;
import 'package:game_keeper/modules/auth/ui/screens/restore_pass_screen.dart'
    as _i9;
import 'package:game_keeper/modules/game_view/ui/screens/more_games_screen.dart'
    as _i6;
import 'package:game_keeper/modules/home/logic/api/model/games_list_model.dart'
    as _i15;
import 'package:game_keeper/modules/home/ui/screens/home_screen.dart' as _i5;
import 'package:game_keeper/modules/home/ui/screens/test_screen.dart' as _i11;
import 'package:game_keeper/modules/profile/ui/screens/profile_screen.dart'
    as _i7;
import 'package:game_keeper/modules/profile/ui/screens/settings_screen.dart'
    as _i1;
import 'package:game_keeper/modules/splash/ui/splash_screen.dart' as _i10;
import 'package:game_keeper/ui/widgets/gk_appbar.dart' as _i14;
import 'package:game_keeper/ui/widgets/gk_navbar.dart' as _i4;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    ApplicationPreferences.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ApplicationPreferences(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i2.AuthScreen()),
      );
    },
    DemoRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DemoScreen(),
      );
    },
    GKNavBar.name: (routeData) {
      final args =
          routeData.argsAs<GKNavBarArgs>(orElse: () => const GKNavBarArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.GKNavBar(
          key: args.key,
          appBar: args.appBar,
          body: args.body,
          floatingActionButton: args.floatingActionButton,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i5.HomeScreen()),
      );
    },
    MoreGamesRoute.name: (routeData) {
      final args = routeData.argsAs<MoreGamesRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.MoreGamesScreen(
          key: args.key,
          gamesListModel: args.gamesListModel,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ProfileScreen(),
      );
    },
    RegisterEmailRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i8.RegisterEmailScreen()),
      );
    },
    RestorePassRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i9.RestorePassScreen()),
      );
    },
    SplashRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SplashScreen(),
      );
    },
    TestedRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.TestedScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.ApplicationPreferences]
class ApplicationPreferences extends _i12.PageRouteInfo<void> {
  const ApplicationPreferences({List<_i12.PageRouteInfo>? children})
      : super(
          ApplicationPreferences.name,
          initialChildren: children,
        );

  static const String name = 'ApplicationPreferences';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AuthScreen]
class AuthRoute extends _i12.PageRouteInfo<void> {
  const AuthRoute({List<_i12.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DemoScreen]
class DemoRoute extends _i12.PageRouteInfo<void> {
  const DemoRoute({List<_i12.PageRouteInfo>? children})
      : super(
          DemoRoute.name,
          initialChildren: children,
        );

  static const String name = 'DemoRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.GKNavBar]
class GKNavBar extends _i12.PageRouteInfo<GKNavBarArgs> {
  GKNavBar({
    _i13.Key? key,
    _i14.GKAppBar? appBar,
    _i13.Widget? body,
    _i13.FloatingActionButton? floatingActionButton,
    List<_i12.PageRouteInfo>? children,
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

  static const _i12.PageInfo<GKNavBarArgs> page =
      _i12.PageInfo<GKNavBarArgs>(name);
}

class GKNavBarArgs {
  const GKNavBarArgs({
    this.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
  });

  final _i13.Key? key;

  final _i14.GKAppBar? appBar;

  final _i13.Widget? body;

  final _i13.FloatingActionButton? floatingActionButton;

  @override
  String toString() {
    return 'GKNavBarArgs{key: $key, appBar: $appBar, body: $body, floatingActionButton: $floatingActionButton}';
  }
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MoreGamesScreen]
class MoreGamesRoute extends _i12.PageRouteInfo<MoreGamesRouteArgs> {
  MoreGamesRoute({
    _i13.Key? key,
    required _i15.GamesListModel gamesListModel,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          MoreGamesRoute.name,
          args: MoreGamesRouteArgs(
            key: key,
            gamesListModel: gamesListModel,
          ),
          initialChildren: children,
        );

  static const String name = 'MoreGamesRoute';

  static const _i12.PageInfo<MoreGamesRouteArgs> page =
      _i12.PageInfo<MoreGamesRouteArgs>(name);
}

class MoreGamesRouteArgs {
  const MoreGamesRouteArgs({
    this.key,
    required this.gamesListModel,
  });

  final _i13.Key? key;

  final _i15.GamesListModel gamesListModel;

  @override
  String toString() {
    return 'MoreGamesRouteArgs{key: $key, gamesListModel: $gamesListModel}';
  }
}

/// generated route for
/// [_i7.ProfileScreen]
class ProfileRoute extends _i12.PageRouteInfo<void> {
  const ProfileRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i8.RegisterEmailScreen]
class RegisterEmailRoute extends _i12.PageRouteInfo<void> {
  const RegisterEmailRoute({List<_i12.PageRouteInfo>? children})
      : super(
          RegisterEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterEmailRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.RestorePassScreen]
class RestorePassRoute extends _i12.PageRouteInfo<void> {
  const RestorePassRoute({List<_i12.PageRouteInfo>? children})
      : super(
          RestorePassRoute.name,
          initialChildren: children,
        );

  static const String name = 'RestorePassRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SplashScreen]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.TestedScreen]
class TestedRoute extends _i12.PageRouteInfo<void> {
  const TestedRoute({List<_i12.PageRouteInfo>? children})
      : super(
          TestedRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestedRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
