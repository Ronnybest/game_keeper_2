import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_keeper/core/router/app_router.gr.dart';
import 'package:game_keeper/core/utils/debouncer.dart';
import 'package:game_keeper/generated/locale.keys.g.dart';
import 'package:game_keeper/modules/games/navbar_games/logic/bloc/games_bloc.dart';
import 'package:game_keeper/modules/games/navbar_games/ui/widgets/search_game_tile.dart';
import 'package:game_keeper/ui/widgets/gk_shimmer.dart';

class SearchGamesDelegate extends SearchDelegate {
  SearchGamesDelegate({required this.gamesBloc});
  final GamesBloc gamesBloc;

  final Debouncer _debouncer =
      Debouncer(delay: const Duration(milliseconds: 500));
  String _lastQuery = '';
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
      IconButton(
          onPressed: () {
            if (query.isEmpty || _lastQuery.isEmpty) return;
            AutoRouter.of(context).push(FullSearchRoute(query: query));
          },
          icon: const Icon(Icons.forward))
    ];
  }

  @override
  String get searchFieldLabel => LocaleKeys.games_search_search_hint.tr();

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Center(
          child: Text(
        LocaleKeys.games_search_search_no_results.tr(),
        style: TextStyle(
          fontSize: 18,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ));
    }
    if (_lastQuery != query) {
      _lastQuery = query;
      _debouncer(
        () {
          gamesBloc.add(GamesEvent.searchGames(query: query));
        },
      );
    }

    return BlocBuilder<GamesBloc, GamesState>(
      bloc: gamesBloc,
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox(),
          searchLoading: () => const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Align(
                alignment: Alignment.topCenter,
                child: GKShimmerGenerator(count: 5)),
          ),
          searchLoaded: (games) {
            if (games.results == null || games.results!.isEmpty) {
              return Center(
                  child: Text(
                LocaleKeys.games_search_search_no_results.tr(),
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ));
            } else {
              return ListView.builder(
                itemCount:
                    games.results!.length > 5 ? 5 : games.results!.length,
                itemBuilder: (context, index) {
                  var game = games.results![index];
                  return GestureDetector(
                    onTap: () {
                      AutoRouter.of(context)
                          .push(GameViewRoute(gameId: game.id!));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 3),
                      child: SearchGameTile(
                        game: game,
                      ),
                    ),
                  );
                },
              );
            }
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Center(
          child: Text(
        LocaleKeys.games_search_search_no_results.tr(),
        style: TextStyle(
          fontSize: 18,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ));
    }
    if (_lastQuery != query) {
      _lastQuery = query;
      _debouncer(
        () {
          gamesBloc.add(GamesEvent.searchGames(query: query));
        },
      );
    }

    return BlocBuilder<GamesBloc, GamesState>(
      bloc: gamesBloc,
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox(),
          searchLoading: () => const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Align(
              alignment: Alignment.topCenter,
              child: GKShimmerGenerator(count: 5),
            ),
          ),
          searchLoaded: (games) {
            if (games.results == null || games.results!.isEmpty) {
              return Center(
                  child: Text(
                LocaleKeys.games_search_search_no_results.tr(),
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ));
            } else {
              return ListView.builder(
                itemCount:
                    games.results!.length > 5 ? 5 : games.results!.length,
                itemBuilder: (context, index) {
                  var game = games.results![index];
                  return GestureDetector(
                    onTap: () {
                      AutoRouter.of(context)
                          .push(GameViewRoute(gameId: game.id!));
                    },
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        child: SearchGameTile(
                          game: game,
                        )),
                  );
                },
              );
            }
          },
        );
      },
    );
  }
}
