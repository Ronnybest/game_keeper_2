part of 'games_bloc.dart';

@freezed
class GamesEvent with _$GamesEvent {
  const factory GamesEvent.searchGames({required String query}) = _SearchGames;
  const factory GamesEvent.searchGamesPaging(
      {required String query, required int page}) = _SearchGamesPaging;
}
