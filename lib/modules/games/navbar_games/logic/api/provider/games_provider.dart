import 'package:game_keeper/core/network/core_api.dart';
import 'package:game_keeper/modules/games/navbar_games/logic/api/models/search_games_model.dart';
import 'package:game_keeper/modules/games/navbar_games/logic/api/service/games_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GamesProvider {
  final CoreApi _coreApi;
  GamesProvider(this._coreApi);

  Future<SearchGamesModel> getGame({
    required String query,
  }) async {
    GamesService gameService = GamesService(_coreApi.rawgIoDio);
    SearchGamesModel result = await gameService.searchGames(query: query);
    return result;
  }

  Future<SearchGamesModel> getGamePaging({
    required String query,
    required int page,
  }) async {
    GamesService gameService = GamesService(_coreApi.rawgIoDio);
    SearchGamesModel result =
        await gameService.searchGamesPaging(query: query, page: page);
    return result;
  }
}
