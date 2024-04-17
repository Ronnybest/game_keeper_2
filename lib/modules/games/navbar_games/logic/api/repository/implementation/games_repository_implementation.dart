import 'package:game_keeper/modules/games/navbar_games/logic/api/models/search_games_model.dart';
import 'package:game_keeper/modules/games/navbar_games/logic/api/provider/games_provider.dart';
import 'package:game_keeper/modules/games/navbar_games/logic/api/repository/games_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: GamesRepository)
class GamesRepositoryImplementation extends GamesRepository {
  final GamesProvider gamesProvider;

  GamesRepositoryImplementation({required this.gamesProvider});

  @override
  Future<SearchGamesModel> searchGames({required String query}) async {
    return await gamesProvider.getGame(query: query);
  }

  @override
  Future<SearchGamesModel> searchGamesPaging(
      {required String query, required int page}) async {
    return await gamesProvider.getGamePaging(query: query, page: page);
  }
}
