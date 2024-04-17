import 'package:easy_localization/easy_localization.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:game_keeper/generated/locale.keys.g.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/model/game_screenshots_model.dart';
import 'package:game_keeper/ui/widgets/gk_shimmer.dart';

class GameScreenshots extends StatelessWidget {
  const GameScreenshots({super.key, required this.screenshots});
  final GameScreenshotsModel screenshots;
  static const double screenshotsImageHeight = 190;
  static const double screenshotsImageWidth = 337;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: SizedBox(
        height: screenshotsImageHeight,
        child: screenshots.results!.isEmpty
            ? Center(
                child: Container(
                  width: screenshotsImageWidth,
                  height: screenshotsImageHeight,
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .secondaryContainer
                        .withOpacity(.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      LocaleKeys.game_view_no_images.tr(),
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
              )
            : ListView.builder(
                cacheExtent: 20,
                itemCount: screenshots.results!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var image = screenshots.results![index];
                  return Container(
                    margin: EdgeInsets.only(
                      right: index == screenshots.results!.length - 1 ? 15 : 10,
                      left: index == 0 ? 15 : 0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FastCachedImage(
                        url: image.image ?? '',
                        fadeInDuration: const Duration(milliseconds: 100),
                        fit: BoxFit.cover,
                        width: screenshotsImageWidth,
                        height: screenshotsImageHeight,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.error,
                            size: 50,
                          );
                        },
                        loadingBuilder: (context, progress) {
                          return ShimmerElement(
                            width: screenshotsImageWidth,
                            height: screenshotsImageHeight,
                            radius: BorderRadius.circular(20),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
