import 'package:game_keeper/modules/home/logic/api/model/games_list_model.dart';
import 'package:game_keeper/modules/home/logic/api/provider/home_provider.dart';
import 'package:game_keeper/modules/home/logic/api/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeProvider _homeProvider;
  HomeRepositoryImpl(this._homeProvider);

  @override
  Future<GamesListModel> getTrendingGames(
          {int? pageSize,
          int? page,
          required String startDate,
          required String endDate}) =>
      _homeProvider.getTrendingGames(
        page: page,
        pageSize: pageSize,
        startDate: startDate,
        endDate: endDate,
      );
}
