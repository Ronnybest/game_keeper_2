import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:game_keeper/core/router/app_router.gr.dart';
import 'package:game_keeper/ui/widgets/gk_appbar.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GKAppBar(
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    AutoRouter.of(context).push(const ApplicationPreferences());
                  },
                  icon: const Icon(Icons.settings))
            ],
          )
        ],
      ),
      body: Container(),
    );
  }
}
