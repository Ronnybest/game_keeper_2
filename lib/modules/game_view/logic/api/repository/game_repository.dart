import 'package:game_keeper/modules/game_view/logic/api/model/full_game_model.dart';
import 'package:game_keeper/modules/game_view/logic/api/model/game_reddit_comments_model.dart';
import 'package:game_keeper/modules/game_view/logic/api/model/game_screenshots_model.dart';

abstract class GameRepository {
  Future<FullGameModel> getGame({
    required int id,
  });

  Future<GameScreenshotsModel> getGameScreenshots({
    required int id,
  });

  Future<GameRedditCommentsModel> getRedditComments({
    required int id,
  });

  Future<GameRedditCommentsModel> getPagingRedditComments({
    required int id,
    required int page,
  });
}
