part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetchTrendingGames(int? page, int? pageSize) = _FetchTrendingGames;
}
