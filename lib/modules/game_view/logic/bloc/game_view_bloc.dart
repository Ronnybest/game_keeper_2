import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_keeper/modules/game_view/logic/api/model/full_game_model.dart';
import 'package:game_keeper/modules/game_view/logic/api/repository/game_repository.dart';
import 'package:injectable/injectable.dart';

part 'game_view_state.dart';
part 'game_view_event.dart';
part 'game_view_bloc.freezed.dart';

@injectable
class GameViewBloc extends Bloc<GameViewEvent, GameViewState> {
  final GameRepository _gameViewRepository;

  GameViewBloc(this._gameViewRepository)
      : super(const GameViewState.initial()) {
    on<GameViewEvent>(_onEvent);
  }

  Future<void> _onEvent(GameViewEvent event, Emitter<GameViewState> emit) {
    return event.map(fetchGame: (_FetchGame value) async {
      try {
        emit(const GameViewState.loadingGame());
        var result = await _gameViewRepository.getGame(id: value.gameId);
        emit(GameViewState.loadedGame(result));
      } catch (e) {
        emit(GameViewState.errorGame(e));
      }
    });
  }
}
