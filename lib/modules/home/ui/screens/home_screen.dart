import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:game_keeper/generated/locale.keys.g.dart';
import 'package:game_keeper/ui/widgets/gk_appbar.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late User user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GKAppBar(
        title: LocaleKeys.home_title.tr(
          namedArgs: {'name': user.displayName ?? 'User'},
        ),
      ),
      body: Text(
        'Home Screen',
      ),
    );
  }
}
