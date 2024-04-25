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
        //AutoRoute(page: HomeRoute.page),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: RegisterEmailRoute.page),
        AutoRoute(page: RestorePassRoute.page),

        // Navugation bar routes
        AutoRoute(
          page: GKNavBar.page,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: GamesRoute.page),
            AutoRoute(page: TestedRoute.page),
            AutoRoute(page: TestedRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
        AutoRoute(page: ApplicationPreferences.page),
        AutoRoute(page: MoreGamesRoute.page),
        AutoRoute(page: GameViewRoute.page),
        AutoRoute(page: RedditCommentsListRoute.page),
        AutoRoute(page: GameAchivementsListRoute.page),
        AutoRoute(page: FullSearchRoute.page),
        AutoRoute(page: GameDeveloperInfoRoute.page),
      ];
}
