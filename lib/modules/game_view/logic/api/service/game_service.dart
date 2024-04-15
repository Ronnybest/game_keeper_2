import 'package:dio/dio.dart';
import 'package:game_keeper/core/constants/constants.dart';
import 'package:game_keeper/modules/game_view/logic/api/model/full_game_model.dart';
import 'package:game_keeper/modules/game_view/logic/api/model/game_screenshots_model.dart';
import 'package:retrofit/retrofit.dart';
part 'game_service.g.dart';

@RestApi()
abstract class GameService {
  factory GameService(Dio dio, {String baseUrl}) = _GameService;

  @GET('games/{id}?key=${AppConstants.publicRawgIoApiKey}')
  Future<FullGameModel> getGame({
    @Path('id') required int id,
  });

  @GET('games/{id}/screenshots?key=${AppConstants.publicRawgIoApiKey}')
  Future<GameScreenshotsModel> getGameScreenshots({
    @Path('id') required int id,
  });
}
