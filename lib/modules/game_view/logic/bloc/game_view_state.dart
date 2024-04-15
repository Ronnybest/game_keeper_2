part of 'game_view_bloc.dart';

@freezed
class GameViewState with _$GameViewState {
  const factory GameViewState.initial() = _Initial;
  const factory GameViewState.loadingGame() = _LoadingGame;
  const factory GameViewState.loadedGame(FullGameModel game, GameScreenshotsModel screenshots) = _LoadedGame;
  const factory GameViewState.errorGame(dynamic message) = _ErrorGame;

}
