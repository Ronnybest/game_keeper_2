import 'package:dio/dio.dart';
import 'package:game_keeper/core/constants/constants.dart';
import 'package:game_keeper/modules/home/logic/api/model/games_list_model.dart';
import 'package:retrofit/retrofit.dart';

part 'home_service.g.dart';

@RestApi()
abstract class HomeService {
  factory HomeService(Dio dio, {String baseUrl}) = _HomeService;

  @GET(
      'games?key=${AppConstants.publicRawgIoApiKey}&ordering=-added&page_size={pageSize}&page={page}&dates={startDate},{endDate}')
  Future<GamesListModel> getTrendingGames({
    @Path('pageSize') int? pageSize,
    @Path('page') int? page,
    @Path('startDate') required String startDate,
    @Path('endDate') required String endDate,
  });
}
