part of 'game_view_bloc.dart';

@freezed
class GameViewEvent with _$GameViewEvent {
  const factory GameViewEvent.fetchGame(int gameId) = _FetchGame;
}
