// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:game_keeper/modules/auth/ui/screens/auth_screen.dart' as _i1;
import 'package:game_keeper/modules/auth/ui/screens/demo_screen.dart' as _i2;
import 'package:game_keeper/modules/auth/ui/screens/register_email_screen.dart'
    as _i4;
import 'package:game_keeper/modules/auth/ui/screens/restore_pass_screen.dart'
    as _i5;
import 'package:game_keeper/modules/home/ui/screens/home_screen.dart' as _i3;
import 'package:game_keeper/modules/splash/ui/splash_screen.dart' as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.WrappedRoute(child: const _i1.AuthScreen()),
      );
    },
    DemoRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DemoScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
    RegisterEmailRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.WrappedRoute(child: const _i4.RegisterEmailScreen()),
      );
    },
    RestorePassRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.WrappedRoute(child: const _i5.RestorePassScreen()),
      );
    },
    SplashRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i7.PageRouteInfo<void> {
  const AuthRoute({List<_i7.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DemoScreen]
class DemoRoute extends _i7.PageRouteInfo<void> {
  const DemoRoute({List<_i7.PageRouteInfo>? children})
      : super(
          DemoRoute.name,
          initialChildren: children,
        );

  static const String name = 'DemoRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.RegisterEmailScreen]
class RegisterEmailRoute extends _i7.PageRouteInfo<void> {
  const RegisterEmailRoute({List<_i7.PageRouteInfo>? children})
      : super(
          RegisterEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterEmailRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.RestorePassScreen]
class RestorePassRoute extends _i7.PageRouteInfo<void> {
  const RestorePassRoute({List<_i7.PageRouteInfo>? children})
      : super(
          RestorePassRoute.name,
          initialChildren: children,
        );

  static const String name = 'RestorePassRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SplashScreen]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
