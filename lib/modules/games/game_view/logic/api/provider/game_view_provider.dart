import 'package:game_keeper/core/network/core_api.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/model/developer_games_list_model.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/model/full_game_model.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/model/game_achievements_model.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/model/game_developer_model.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/model/game_reddit_comments_model.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/model/game_screenshots_model.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/model/where_to_buy_model.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/service/game_view_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GameViewProvider {
  final CoreApi _coreApi;
  GameViewProvider(this._coreApi);

  Future<FullGameModel> getGame({
    required int id,
  }) async {
    GameViewService gameService = GameViewService(_coreApi.rawgIoDio);
    FullGameModel result = await gameService.getGame(id: id);
    return result;
  }

  Future<GameScreenshotsModel> getGameScreenshots({
    required int id,
  }) async {
    GameViewService gameService = GameViewService(_coreApi.rawgIoDio);
    GameScreenshotsModel result = await gameService.getGameScreenshots(id: id);
    return result;
  }

  Future<GameRedditCommentsModel> getRedditComments({
    required int id,
  }) async {
    GameViewService gameService = GameViewService(_coreApi.rawgIoDio);
    return await gameService.getRedditComments(id: id);
  }

  Future<GameRedditCommentsModel> getPagingRedditComments({
    required int id,
    required int page,
  }) async {
    GameViewService gameService = GameViewService(_coreApi.rawgIoDio);
    return await gameService.getPagingRedditComments(id: id, page: page);
  }

  Future<GameAchievementsModel> getPagingGameAchievements(
      {required int id, required int page}) async {
    GameViewService gameService = GameViewService(_coreApi.rawgIoDio);
    return await gameService.getPagingGameAchievements(id: id, page: page);
  }

  Future<WhereToBuyModel> getWhereToBuy({
    required int id,
  }) async {
    GameViewService gameService = GameViewService(_coreApi.rawgIoDio);
    return await gameService.getWhereToBuy(id: id);
  }

  Future<GameDeveloperModel> getGameDeveloperInfo({required int id}) async {
    GameViewService gameService = GameViewService(_coreApi.rawgIoDio);
    return await gameService.getGameDeveloperInfo(id: id);
  }

  Future<DeveloperGamesListModel> getGamesByDeveloper(
      {required int id, required int page}) async {
    GameViewService gameService = GameViewService(_coreApi.rawgIoDio);
    return await gameService.getGamesByDeveloper(id: id, page: page);
  }
}
