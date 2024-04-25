import 'package:game_keeper/modules/games/game_view/logic/api/model/developer_games_list_model.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/model/full_game_model.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/model/game_achievements_model.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/model/game_developer_model.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/model/game_reddit_comments_model.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/model/game_screenshots_model.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/model/where_to_buy_model.dart';

abstract class GameViewRepository {
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

  Future<GameAchievementsModel> getPagingGameAchievements(
      {required int id, required int page});

  Future<WhereToBuyModel> getWhereToBuy({
    required int id,
  });

  Future<GameDeveloperModel> getGameDeveloperInfo({required int id});

  Future<DeveloperGamesListModel> getGamesByDeveloper({required int id, required int page});
}
