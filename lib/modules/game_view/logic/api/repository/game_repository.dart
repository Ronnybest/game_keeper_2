import 'package:game_keeper/modules/game_view/logic/api/model/full_game_model.dart';

abstract class GameRepository {
  Future<FullGameModel> getGame({
    required int id,
  });
}
