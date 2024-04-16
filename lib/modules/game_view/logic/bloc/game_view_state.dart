part of 'game_view_bloc.dart';

@freezed
class GameViewState with _$GameViewState {
  const factory GameViewState.initial() = _Initial;
  const factory GameViewState.loadingGame() = _LoadingGame;
  const factory GameViewState.loadedGame(FullGameModel game, GameScreenshotsModel screenshots, GameRedditCommentsModel redditComments) = _LoadedGame;
  const factory GameViewState.errorGame(dynamic message) = _ErrorGame;

  const factory GameViewState.loadingPagingRedditComments() = _LoadingPagingRedditComments;
  const factory GameViewState.loadedPagingRedditComments(GameRedditCommentsModel redditComments) = _LoadedPagingRedditComments;
  const factory GameViewState.errorPagingRedditComments(dynamic message) = _ErrorPagingRedditComments;

}
