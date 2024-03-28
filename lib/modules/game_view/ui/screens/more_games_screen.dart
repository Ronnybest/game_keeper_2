import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:game_keeper/generated/locale.keys.g.dart';
import 'package:game_keeper/modules/home/logic/api/model/games_list_model.dart';
import 'package:game_keeper/ui/widgets/gk_appbar.dart';

@RoutePage()
class MoreGamesScreen extends StatefulWidget {
  const MoreGamesScreen({super.key, required this.gamesListModel});
  final GamesListModel gamesListModel;

  @override
  State<MoreGamesScreen> createState() => _MoreGamesScreenState();
}

class _MoreGamesScreenState extends State<MoreGamesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GKAppBar(
        title: LocaleKeys.home_trend_games.tr(),
      ),
      body: Placeholder()
      // SingleChildScrollView(
      //   physics: const AlwaysScrollableScrollPhysics(),
      //   child: Column(
      //     children: [
      //       ListView.builder(
      //         itemCount: 10,
      //         itemBuilder: (context, index) {
      //           return SizedBox(
      //             height: 100,
      //             width: 100,
      //             child: Text(index.toString()));
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
