import 'package:game_keeper/modules/games/navbar_games/logic/api/models/search_games_model.dart';

abstract class GamesRepository {
  Future<SearchGamesModel> searchGames({
    required String query,
  });

  Future<SearchGamesModel> searchGamesPaging({
    required String query,
    required int page,
  });
}
