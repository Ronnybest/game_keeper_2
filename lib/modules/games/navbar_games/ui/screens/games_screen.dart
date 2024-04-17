import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:game_keeper/modules/games/navbar_games/logic/bloc/games_bloc.dart';
import 'package:game_keeper/modules/games/navbar_games/ui/screens/search_screen.dart';
import 'package:game_keeper/ui/widgets/gk_appbar.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GKAppBar(
        title: 'GMAES',
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate:
                      SearchGamesDelegate(gamesBloc: GetIt.I<GamesBloc>()));
            },
          ),
        ],
      ),
      body: Container(),
    );
  }
}
