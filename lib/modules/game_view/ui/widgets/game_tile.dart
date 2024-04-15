import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:game_keeper/core/router/app_router.gr.dart';
import 'package:game_keeper/modules/home/logic/api/model/games_list_model.dart';
import 'package:game_keeper/ui/widgets/gk_shimmer.dart';

class GameTile extends StatelessWidget {
  const GameTile({super.key, required this.game});
  final GameResult game;
  static const double imageSize = 60;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(
          GameViewRoute(gameId: game.id ?? -1),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        margin: const EdgeInsets.all(8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FastCachedImage(
                url: game.backgroundImage ?? '',
                height: imageSize,
                width: imageSize,
                fadeInDuration: const Duration(milliseconds: 100),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.gamepad,
                    size: imageSize,
                  );
                },
                loadingBuilder: (context, progress) {
                  return ShimmerElement(
                    width: imageSize,
                    height: imageSize,
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
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('dd.MM.yyyy').format(game.released!),
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(.7),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        game.rating.toString(),
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(.7),
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Icon(
                        Icons.star,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 13,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
