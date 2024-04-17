part of 'game_view_bloc.dart';

@freezed
class GameViewEvent with _$GameViewEvent {
  const factory GameViewEvent.fetchGame(int gameId) = _FetchGame;

  const factory GameViewEvent.fetchPagingRedditComments(int id, int page) =
      _FetchPagingRedditComments;

  const factory GameViewEvent.fetchPagingGameAchievements(int id, int page) =
      _FetchPagingGameAchievements;
}
