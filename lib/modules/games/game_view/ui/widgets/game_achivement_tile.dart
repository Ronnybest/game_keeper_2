import 'package:easy_localization/easy_localization.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_keeper/generated/locale.keys.g.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/model/game_achievements_model.dart';
import 'package:game_keeper/ui/widgets/gk_shimmer.dart';

class GameAchivementTile extends StatelessWidget {
  const GameAchivementTile({super.key, required this.achivement});
  final Result achivement;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        shadowColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FastCachedImage(
                  url: achivement.image ?? '',
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, _) {
                    return const Icon(
                      Icons.error,
                      size: 60,
                    );
                  },
                  loadingBuilder: (p0, p1) {
                    return ShimmerElement(
                        width: 60,
                        height: 60,
                        radius: BorderRadius.circular(10));
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      achivement.name!,
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      achivement.description!,
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "${LocaleKeys.game_view_achivement_tile_owners.tr()}: ${achivement.percent}%",
                          softWrap: true,
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          LocaleKeys
                              .game_view_achivement_tile_owners_description
                              .tr(),
                          style: TextStyle(
                            fontSize: 10,
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
        ),
      ),
    );
  }
}
