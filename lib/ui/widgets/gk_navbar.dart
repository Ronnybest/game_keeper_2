import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:game_keeper/core/router/app_router.gr.dart' as app_router;
import 'package:game_keeper/generated/locale.keys.g.dart';
import 'package:game_keeper/ui/widgets/gk_appbar.dart';

@RoutePage()
class GKNavBar extends StatefulWidget {
  final GKAppBar? appBar;
  final Widget? body;
  final FloatingActionButton? floatingActionButton;
  const GKNavBar(
      {super.key, this.appBar, this.body, this.floatingActionButton});

  @override
  State<GKNavBar> createState() => _GKNavBarState();
}

class _GKNavBarState extends State<GKNavBar> {
  static User user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        app_router.HomeRoute(),
        app_router.GamesRoute(),
        app_router.TestedRoute(),
        app_router.TestedRoute(),
        app_router.ProfileRoute(),
      ],
      homeIndex: 0,
      transitionBuilder: (context, child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 200),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: NavigationBar(
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: (index) {
              tabsRouter.setActiveIndex(index);
            },
            destinations: _destinations,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          ),
        );
      },
    );
  }

  final List<NavigationDestination> _destinations = [
    NavigationDestination(
      icon: const Icon(Icons.home),
      label: LocaleKeys.navbar_home.tr(),
    ),
    NavigationDestination(
      icon: const Icon(Icons.gamepad),
      label: LocaleKeys.navbar_games.tr(),
    ),
    NavigationDestination(
      icon: const Icon(Icons.dashboard),
      label: LocaleKeys.navbar_services.tr(),
    ),
    NavigationDestination(
      icon: const Icon(Icons.person),
      label: LocaleKeys.navbar_friends.tr(),
    ),
    NavigationDestination(
      icon: SizedBox(
        width: 24,
        height: 24,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: FastCachedImage(
            url: user.photoURL ?? '',
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.person);
            },
          ),
        ),
      ),
      label: LocaleKeys.navbar_profile.tr(),
    ),
  ];
}
