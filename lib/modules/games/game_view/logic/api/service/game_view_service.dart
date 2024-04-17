import 'package:dio/dio.dart';
import 'package:game_keeper/core/constants/constants.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/model/full_game_model.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/model/game_achievements_model.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/model/game_reddit_comments_model.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/model/game_screenshots_model.dart';
import 'package:retrofit/retrofit.dart';
part 'game_view_service.g.dart';

@RestApi()
abstract class GameViewService {
  factory GameViewService(Dio dio, {String baseUrl}) = _GameViewService;

  @GET('games/{id}?key=${AppConstants.publicRawgIoApiKey}')
  Future<FullGameModel> getGame({
    @Path('id') required int id,
  });

  @GET('games/{id}/screenshots?key=${AppConstants.publicRawgIoApiKey}')
  Future<GameScreenshotsModel> getGameScreenshots({
    @Path('id') required int id,
  });

  @GET('games/{id}/reddit?key=${AppConstants.publicRawgIoApiKey}')
  Future<GameRedditCommentsModel> getRedditComments({
    @Path('id') required int id,
  });

  @GET('games/{id}/reddit?key=${AppConstants.publicRawgIoApiKey}&page={page}')
  Future<GameRedditCommentsModel> getPagingRedditComments({
    @Path('id') required int id,
    @Path('page') required int page,
  });

  @GET('games/{id}/achievements?key=${AppConstants.publicRawgIoApiKey}&page={page}')
  Future<GameAchievementsModel> getPagingGameAchievements({
    @Path('id') required int id,
    @Path('page') required int page,
  });
}
