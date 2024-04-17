import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_keeper/modules/games/navbar_games/logic/api/models/search_games_model.dart';
import 'package:game_keeper/modules/games/navbar_games/logic/api/repository/games_repository.dart';
import 'package:injectable/injectable.dart';

part 'games_state.dart';
part 'games_event.dart';
part 'games_bloc.freezed.dart';

@injectable
class GamesBloc extends Bloc<GamesEvent, GamesState> {
  final GamesRepository _gamesRepository;

  GamesBloc(this._gamesRepository) : super(const GamesState.initial()) {
    on<GamesEvent>(_onEvent);
  }

  Future<void> _onEvent(GamesEvent event, Emitter<GamesState> emit) {
    return event.map(
      searchGames: (_SearchGames value) async {
        try {
          emit(const GamesState.searchLoading());
          var result = await _gamesRepository.searchGames(query: value.query);
          emit(GamesState.searchLoaded(result));
        } catch (e) {
          emit(GamesState.searchError(e));
        }
      },
      searchGamesPaging: (value) async {
        try {
          emit(const GamesState.searchPagingLoading());
          var result = await _gamesRepository.searchGamesPaging(
              query: value.query, page: value.page);
          emit(GamesState.searchPagingLoaded(result));
        } catch (e) {
          emit(GamesState.searchPagingError(e));
        }
      },
    );
  }
}
