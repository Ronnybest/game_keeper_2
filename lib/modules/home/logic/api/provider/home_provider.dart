import 'package:game_keeper/core/network/core_api.dart';
import 'package:game_keeper/modules/home/logic/api/model/games_list_model.dart';
import 'package:game_keeper/modules/home/logic/api/service/home_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HomeProvider {
  final CoreApi _coreApi;
  HomeProvider(this._coreApi);

  Future<GamesListModel> getTrendingGames({
    int? pageSize,
    int? page,
    required String startDate,
    required String endDate,
  }) async {
    HomeService homeService = HomeService(_coreApi.rawgIoDio);
    GamesListModel result = await homeService.getTrendingGames(
        pageSize: pageSize, page: page, startDate: startDate, endDate: endDate);
    return result;
  }
}
