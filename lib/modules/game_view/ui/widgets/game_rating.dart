import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:game_keeper/generated/locale.keys.g.dart';
import 'package:game_keeper/modules/game_view/logic/api/model/full_game_model.dart';
import 'package:game_keeper/modules/game_view/ui/widgets/game_rating_area.dart';

class GameRating extends StatelessWidget {
  const GameRating({super.key, required this.game});
  final FullGameModel game;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.game_view_community_ratings.tr(),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            LocaleKeys.game_view_community_ratings.tr(),
                          ),
                          content: Text(
                            LocaleKeys.game_view_community_ratings_description
                                .tr(),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                LocaleKeys.common_buttons_close.tr(),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Icon(
                    Icons.info_outlined,
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          BuildRatingArea(
            game: game,
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
