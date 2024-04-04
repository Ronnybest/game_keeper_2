part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetchUserData() = _FetchUserData;
  const factory HomeEvent.fetchTrendingGames(int? page, int? pageSize) = _FetchTrendingGames;
  const factory HomeEvent.fetchPaginationTrendingGames(int? page, int? pageSize) = _FetchPaginationTrendingGames;
  const factory HomeEvent.updateUserData(UserFirestore user) = _UpdateUserData;
}
