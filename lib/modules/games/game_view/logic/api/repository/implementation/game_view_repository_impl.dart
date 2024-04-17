import 'package:game_keeper/modules/games/game_view/logic/api/model/full_game_model.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/model/game_achievements_model.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/model/game_reddit_comments_model.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/model/game_screenshots_model.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/provider/game_view_provider.dart';
import 'package:injectable/injectable.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/repository/game_view_repository.dart';

@LazySingleton(as: GameViewRepository)
class GameViewRepositoryImpl implements GameViewRepository {
  final GameViewProvider _gameProvider;
  GameViewRepositoryImpl(this._gameProvider);

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

  @override
  Future<GameRedditCommentsModel> getRedditComments({
    required int id,
  }) async {
    return _gameProvider.getRedditComments(id: id);
  }

  @override
  Future<GameRedditCommentsModel> getPagingRedditComments({
    required int id,
    required int page,
  }) async {
    return _gameProvider.getPagingRedditComments(id: id, page: page);
  }

  @override
  Future<GameAchievementsModel> getPagingGameAchievements(
      {required int id, required int page}) async {
    return _gameProvider.getPagingGameAchievements(id: id, page: page);
  }
}
