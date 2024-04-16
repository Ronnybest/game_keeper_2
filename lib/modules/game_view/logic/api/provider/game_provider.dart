import 'package:game_keeper/core/network/core_api.dart';
import 'package:game_keeper/modules/game_view/logic/api/model/full_game_model.dart';
import 'package:game_keeper/modules/game_view/logic/api/model/game_reddit_comments_model.dart';
import 'package:game_keeper/modules/game_view/logic/api/model/game_screenshots_model.dart';
import 'package:game_keeper/modules/game_view/logic/api/service/game_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GameProvider {
  final CoreApi _coreApi;
  GameProvider(this._coreApi);

  Future<FullGameModel> getGame({
    required int id,
  }) async {
    GameService gameService = GameService(_coreApi.rawgIoDio);
    FullGameModel result = await gameService.getGame(id: id);
    return result;
  }

  Future<GameScreenshotsModel> getGameScreenshots({
    required int id,
  }) async {
    GameService gameService = GameService(_coreApi.rawgIoDio);
    GameScreenshotsModel result = await gameService.getGameScreenshots(id: id);
    return result;
  }

  Future<GameRedditCommentsModel> getRedditComments({
    required int id,
  }) async {
    GameService gameService = GameService(_coreApi.rawgIoDio);
    return await gameService.getRedditComments(id: id);
  }

  Future<GameRedditCommentsModel> getPagingRedditComments({
    required int id,
    required int page,
  }) async {
    GameService gameService = GameService(_coreApi.rawgIoDio);
    return await gameService.getPagingRedditComments(id: id, page: page);
  }
}
