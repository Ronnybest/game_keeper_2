import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:game_keeper/core/router/app_router.gr.dart';
import 'package:game_keeper/modules/auth/logic/utils/auth_google.dart';
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
        (status) {
          if (status == AnimationStatus.completed) {
            Future.delayed(const Duration(milliseconds: 450));
            User? user = GetIt.I<AuthGoogle>().currentUser;
            if (user == null) {
              AutoRouter.of(context).replace(const HomeRoute());
            } else {
              AutoRouter.of(context).replace(const DemoRoute());
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
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/lottie/splash.json',
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
