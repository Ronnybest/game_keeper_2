// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:game_keeper/modules/auth/ui/screens/auth_screen.dart' as _i1;
import 'package:game_keeper/modules/auth/ui/screens/demo_screen.dart' as _i2;
import 'package:game_keeper/modules/auth/ui/screens/register_email_screen.dart'
    as _i5;
import 'package:game_keeper/modules/auth/ui/screens/restore_pass_screen.dart'
    as _i6;
import 'package:game_keeper/modules/home/ui/screens/home_screen.dart' as _i4;
import 'package:game_keeper/modules/home/ui/screens/test_screen.dart' as _i8;
import 'package:game_keeper/modules/splash/ui/splash_screen.dart' as _i7;
import 'package:game_keeper/ui/widgets/gk_appbar.dart' as _i11;
import 'package:game_keeper/ui/widgets/gk_navbar.dart' as _i3;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i1.AuthScreen()),
      );
    },
    DemoRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DemoScreen(),
      );
    },
    GKNavBar.name: (routeData) {
      final args =
          routeData.argsAs<GKNavBarArgs>(orElse: () => const GKNavBarArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.GKNavBar(
          key: args.key,
          appBar: args.appBar,
          body: args.body,
          floatingActionButton: args.floatingActionButton,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    RegisterEmailRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i5.RegisterEmailScreen()),
      );
    },
    RestorePassRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i6.RestorePassScreen()),
      );
    },
    SplashRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SplashScreen(),
      );
    },
    TestedRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.TestedScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i9.PageRouteInfo<void> {
  const AuthRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DemoScreen]
class DemoRoute extends _i9.PageRouteInfo<void> {
  const DemoRoute({List<_i9.PageRouteInfo>? children})
      : super(
          DemoRoute.name,
          initialChildren: children,
        );

  static const String name = 'DemoRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.GKNavBar]
class GKNavBar extends _i9.PageRouteInfo<GKNavBarArgs> {
  GKNavBar({
    _i10.Key? key,
    _i11.GKAppBar? appBar,
    _i10.Widget? body,
    _i10.FloatingActionButton? floatingActionButton,
    List<_i9.PageRouteInfo>? children,
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

  static const _i9.PageInfo<GKNavBarArgs> page =
      _i9.PageInfo<GKNavBarArgs>(name);
}

class GKNavBarArgs {
  const GKNavBarArgs({
    this.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
  });

  final _i10.Key? key;

  final _i11.GKAppBar? appBar;

  final _i10.Widget? body;

  final _i10.FloatingActionButton? floatingActionButton;

  @override
  String toString() {
    return 'GKNavBarArgs{key: $key, appBar: $appBar, body: $body, floatingActionButton: $floatingActionButton}';
  }
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.RegisterEmailScreen]
class RegisterEmailRoute extends _i9.PageRouteInfo<void> {
  const RegisterEmailRoute({List<_i9.PageRouteInfo>? children})
      : super(
          RegisterEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterEmailRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.RestorePassScreen]
class RestorePassRoute extends _i9.PageRouteInfo<void> {
  const RestorePassRoute({List<_i9.PageRouteInfo>? children})
      : super(
          RestorePassRoute.name,
          initialChildren: children,
        );

  static const String name = 'RestorePassRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SplashScreen]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.TestedScreen]
class TestedRoute extends _i9.PageRouteInfo<void> {
  const TestedRoute({List<_i9.PageRouteInfo>? children})
      : super(
          TestedRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestedRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
