import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:game_keeper/generated/locale.keys.g.dart';
import 'package:game_keeper/modules/game_view/logic/api/model/full_game_model.dart';
import 'package:game_keeper/modules/game_view/ui/widgets/game_info_card.dart';

class GameActions extends StatelessWidget {
  const GameActions({super.key, required this.game});
  final FullGameModel game;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GameInfoCard(
                constraints: constraints,
                value: game.added.toString(),
                title: LocaleKeys.game_view_added.tr(),
                icon: Icons.check,
              ),
              GameInfoCard(
                constraints: constraints,
                value: game.rating.toString(),
                title: LocaleKeys.game_view_rating.tr(),
                icon: Icons.star,
              ),
              GameInfoCard(
                constraints: constraints,
                value: game.suggestionsCount.toString(),
                title: LocaleKeys.game_view_suggestions.tr(),
                icon: Icons.thumb_up,
              ),
              GameInfoCard(
                constraints: constraints,
                value: game.achievementsCount == 0 ||
                        game.achievementsCount == null
                    ? LocaleKeys.game_view_nd.tr()
                    : game.achievementsCount.toString(),
                title: LocaleKeys.game_view_achivements.tr(),
                icon: Icons.emoji_events,
              ),
            ],
          );
        },
      ),
    );
  }
}
