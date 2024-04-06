import 'package:game_keeper/core/network/core_api.dart';
import 'package:game_keeper/modules/game_view/logic/api/model/full_game_model.dart';
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
}