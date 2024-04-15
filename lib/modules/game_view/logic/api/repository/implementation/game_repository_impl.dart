import 'package:game_keeper/modules/game_view/logic/api/model/full_game_model.dart';
import 'package:game_keeper/modules/game_view/logic/api/model/game_screenshots_model.dart';
import 'package:game_keeper/modules/game_view/logic/api/provider/game_provider.dart';
import 'package:injectable/injectable.dart';
import 'package:game_keeper/modules/game_view/logic/api/repository/game_repository.dart';

@LazySingleton(as: GameRepository)
class GameRepositoryImpl implements GameRepository {
  final GameProvider _gameProvider;
  GameRepositoryImpl(this._gameProvider);

  @override
  Future<FullGameModel> getGame({
    required int id,
  }) async {
    return _gameProvider.getGame(id: id);
  }

  @override
  Future<GameScreenshotsModel> getGameScreenshots({
    required int id,
  }) async {
    return _gameProvider.getGameScreenshots(id: id);
  }
}
