part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loadingTrendingGames() = _LoadingTrendingGames;
  const factory HomeState.loadedTrendingGames(GamesListModel result) =
      _LoadedTrendingGames;
  const factory HomeState.errorTrendingGames(dynamic error) =
      _ErrorTrendingGames;
}
