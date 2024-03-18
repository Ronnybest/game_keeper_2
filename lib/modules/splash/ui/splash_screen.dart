import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:game_keeper/core/constants/constants.dart';
import 'package:game_keeper/core/router/app_router.gr.dart';
import 'package:game_keeper/core/utils/shared_prefs.dart';
import 'package:game_keeper/modules/auth/logic/utils/auth_google.dart';
import 'package:game_keeper/modules/auth/ui/screens/demo_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this)
      ..addStatusListener(
        (status) async {
          if (status == AnimationStatus.completed) {
            Future.delayed(const Duration(milliseconds: 450));
            User? user = GetIt.I<AuthGoogle>().currentUser;
            var sharedPrefs =
                await GetIt.I<SharedPrefencesUtil>().sharedPreferencesInit();
            if (mounted) {
              if (user != null) {
                AutoRouter.of(context).replace(const HomeRoute());
              } else if (sharedPrefs
                      .getString(SharedPrefsConstants.hasSeenDemo) ==
                  DemoSharedPrefsValues.showed) {
                AutoRouter.of(context).replace(const AuthRoute());
              } else {
                AutoRouter.of(context).replace(const DemoRoute());
              }
            } else {
              return;
            }
          }
        },
      );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = Theme.of(context).brightness;
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          currentBrightness == Brightness.light
              ? 'assets/lottie/splash_lighttheme.json'
              : 'assets/lottie/splash_darktheme.json',
          controller: _controller,
          frameRate: FrameRate.max,
          fit: BoxFit.fill,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward();
          },
        ),
      ),
    );
  }
}
