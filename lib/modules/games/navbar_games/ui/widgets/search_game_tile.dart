import 'package:easy_localization/easy_localization.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:game_keeper/modules/games/navbar_games/logic/api/models/search_games_model.dart';
import 'package:game_keeper/ui/widgets/gk_shimmer.dart';

class SearchGameTile extends StatelessWidget {
  const SearchGameTile({super.key, required this.game});
  final Result game;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(game.name ?? ''),
        subtitle: Text(
          game.released != null ? DateFormat('dd.MM.yyyy').format(game.released!) : '',
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FastCachedImage(
            url: game.backgroundImage ?? '',
            height: 60,
            width: 60,
            fit: BoxFit.cover,
            errorBuilder: (__, ___, _) {
              return const Icon(
                Icons.gamepad,
                size: 60,
              );
            },
            loadingBuilder: (_, __) {
              return ShimmerElement(
                width: 60,
                height: 60,
                radius: BorderRadius.circular(10),
              );
            },
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
