import 'package:game_keeper/modules/home/logic/api/model/games_list_model.dart';

abstract class HomeRepository {
  Future<GamesListModel> getTrendingGames({
    int? pageSize,
    int? page,
    required String startDate,
    required String endDate,
  });
}
