

import 'package:dio/dio.dart';
import 'package:game_keeper/core/constants/constants.dart';
import 'package:game_keeper/modules/games/navbar_games/logic/api/models/search_games_model.dart';
import 'package:retrofit/retrofit.dart';
part 'games_service.g.dart';
@RestApi()
abstract class GamesService {
  factory GamesService(Dio dio, {String baseUrl}) = _GamesService;

  @GET('games?key=${AppConstants.publicRawgIoApiKey}&search={query}')
  Future<SearchGamesModel> searchGames({
    @Path('query') required String query,
  });

  @GET('games?key=${AppConstants.publicRawgIoApiKey}&search={query}&page={page}')
  Future<SearchGamesModel> searchGamesPaging({
    @Path('query') required String query,
    @Path('page') required int page,
  });

}