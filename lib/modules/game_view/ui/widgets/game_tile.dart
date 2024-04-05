import 'package:easy_localization/easy_localization.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:game_keeper/modules/home/logic/api/model/games_list_model.dart';
import 'package:game_keeper/ui/widgets/gk_shimmer.dart';

class GameTile extends StatelessWidget {
  const GameTile({super.key, required this.game});
  final GameResult game;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      margin: const EdgeInsets.all(8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: FastCachedImage(
              url: game.backgroundImage ?? '',
              height: 65,
              width: 65,
              fadeInDuration: const Duration(milliseconds: 100),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.gamepad,
                  size: 65,
                );
              },
              loadingBuilder: (context, progress) {
                return ShimmerElement(
                  width: 65,
                  height: 65,
                  radius: BorderRadius.circular(15),
                );
              },
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  game.name!,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      DateFormat('dd.MM.yyyy').format(game.released!),
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(.7),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
