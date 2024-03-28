part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.loadingUserData() = _LoadingUserData;
  const factory HomeState.loadedUserData(UserFirestore user) = _LoadedUserData;
  const factory HomeState.errorUserData(dynamic error) = _ErrorUserData;

  const factory HomeState.loadingTrendingGames() = _LoadingTrendingGames;
  const factory HomeState.loadedTrendingGames(GamesListModel result) =
      _LoadedTrendingGames;
  const factory HomeState.errorTrendingGames(dynamic error) =
      _ErrorTrendingGames;

      const factory HomeState.loadingUpdateUserData() = _LoadingUpdateUserData;
  const factory HomeState.loadedUpdateUserData() = _LoadedUpdateUserData;
  const factory HomeState.errorUpdateUserData(dynamic error) = _ErrorUpdateUserData;
}
