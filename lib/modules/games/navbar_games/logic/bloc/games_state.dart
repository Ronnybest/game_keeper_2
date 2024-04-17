part of 'games_bloc.dart';

@freezed
class GamesState with _$GamesState {
  const factory GamesState.initial() = _Initial;
  const factory GamesState.loading() = _Loading;
  const factory GamesState.loaded() = _Loaded;
  const factory GamesState.error() = _Error;

  const factory GamesState.searchLoading() = _SearchLoading;
  const factory GamesState.searchLoaded(SearchGamesModel result) = _SearchLoaded;
  const factory GamesState.searchError(dynamic message) = _SearchError;

  const factory GamesState.searchPagingLoading() = _SearchPagingLoading;
  const factory GamesState.searchPagingLoaded(SearchGamesModel result) = _SearchPagingLoaded;
  const factory GamesState.searchPagingError(dynamic message) = _SearchPagingError;
}