import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:game_keeper/ui/widgets/gk_appbar.dart';

@RoutePage()
class TestedScreen extends StatelessWidget {
  const TestedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GKAppBar(
          title: 'Test',
        ),
        body: Center(
          child: Text('Test Screen'),
        ));
  }
}
