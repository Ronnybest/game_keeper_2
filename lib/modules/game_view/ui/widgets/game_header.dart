import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:game_keeper/modules/game_view/logic/api/model/full_game_model.dart';
import 'package:game_keeper/ui/widgets/gk_shimmer.dart';

class GameHeader extends StatelessWidget {
  const GameHeader({super.key, required this.game});
  final FullGameModel game;
  static const double logoImageSize = 80;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: FastCachedImage(
              url: game.backgroundImage ?? '',
              height: logoImageSize,
              width: logoImageSize,
              fadeInDuration: const Duration(milliseconds: 100),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.gamepad,
                  size: logoImageSize,
                );
              },
              loadingBuilder: (context, progress) {
                return ShimmerElement(
                  width: logoImageSize,
                  height: logoImageSize,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  game.name!,
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (game.developers!.isNotEmpty)
                  Row(
                    children: game.developers!
                        .map(
                          (e) => Expanded(
                            child: Text(
                              e.name!,
                              softWrap: true,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
