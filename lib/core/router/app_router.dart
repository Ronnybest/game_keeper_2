import 'package:auto_route/auto_route.dart';
import 'package:game_keeper/core/router/app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends $AppRouter {

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: DemoRoute.page),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: RegisterEmailRoute.page),
        AutoRoute(page: RestorePassRoute.page),
      ];
}
