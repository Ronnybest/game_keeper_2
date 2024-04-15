import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_keeper/core/utils/exception_worker.dart';
import 'package:game_keeper/generated/locale.keys.g.dart';
import 'package:game_keeper/modules/game_view/logic/bloc/game_view_bloc.dart';
import 'package:game_keeper/modules/game_view/ui/widgets/animated_description.dart';
import 'package:game_keeper/modules/game_view/ui/widgets/game_info_card.dart';
import 'package:game_keeper/modules/game_view/ui/widgets/game_rating_area.dart';
import 'package:game_keeper/ui/widgets/gk_appbar.dart';
import 'package:game_keeper/ui/widgets/gk_shimmer.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class GameViewScreen extends StatefulWidget implements AutoRouteWrapper {
  const GameViewScreen({super.key, required this.gameId});
  final int gameId;
  @override
  State<GameViewScreen> createState() => _GameViewScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<GameViewBloc>(
        create: (_) => GetIt.I<GameViewBloc>(),
        child: this,
      ),
    ], child: this);
  }
}

class _GameViewScreenState extends State<GameViewScreen>
    with SingleTickerProviderStateMixin {
  static const double logoImageSize = 80;
  static const double screenshotsImageHeight = 190;
  static const double screenshotsImageWidth = 337;
  bool isDescriptionExpanded = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GameViewBloc>(context).add(
      GameViewEvent.fetchGame(widget.gameId),
    );
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GKAppBar(
        actions: [],
      ),
      body: BlocConsumer<GameViewBloc, GameViewState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            errorGame: (error) {
              GetIt.I<ExceptionWorker>().errorWorker(error, context);
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox(),
            loadingGame: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loadedGame: (game, screenshots) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 15, right: 15, bottom: 10),
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
                    ),
                    Padding(
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
                    ),
                    Padding(
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
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
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
                                      right: index ==
                                              screenshots.results!.length - 1
                                          ? 15
                                          : 10,
                                      left: index == 0 ? 15 : 0,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: FastCachedImage(
                                        url: image.image ?? '',
                                        fadeInDuration:
                                            const Duration(milliseconds: 100),
                                        fit: BoxFit.cover,
                                        width: screenshotsImageWidth,
                                        height: screenshotsImageHeight,
                                        errorBuilder:
                                            (context, error, stackTrace) {
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
                    ),
                    Padding(
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
                                            LocaleKeys
                                                .game_view_community_ratings
                                                .tr(),
                                          ),
                                          content: Text(
                                            LocaleKeys
                                                .game_view_community_ratings_description
                                                .tr(),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                LocaleKeys.common_buttons_close
                                                    .tr(),
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
                    ),
                    if (game.descriptionRaw != null &&
                        game.descriptionRaw!.isNotEmpty)
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 15, right: 15),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isDescriptionExpanded =
                                      !isDescriptionExpanded;
                                  if (isDescriptionExpanded) {
                                    _controller.forward();
                                  } else {
                                    _controller.reverse();
                                  }
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    LocaleKeys.game_view_description.tr(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  RotationTransition(
                                    turns:
                                        Tween(begin: 0.25, end: 0.75).animate(
                                      CurvedAnimation(
                                        parent: _controller,
                                        curve: Curves.easeInOut,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            AnimatedDescription(
                              expand: isDescriptionExpanded,
                              child: Text(
                                game.descriptionRaw ?? '',
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              );
            },
            errorGame: (error) {
              return Center(
                child: Text('Error: $error'),
              );
            },
          );
        },
      ),
    );
  }
}
