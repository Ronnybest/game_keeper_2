import 'package:auto_route/auto_route.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_keeper/core/utils/exception_worker.dart';
import 'package:game_keeper/modules/game_view/logic/bloc/game_view_bloc.dart';
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

class _GameViewScreenState extends State<GameViewScreen> {
  static const double imageSize = 80;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GameViewBloc>(context).add(
      GameViewEvent.fetchGame(widget.gameId),
    );
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
            orElse: () => const Center(child: CircularProgressIndicator()),
            loadedGame: (game) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  game.name!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (game.developers!.isNotEmpty)
                                  Row(
                                    children: game.developers!
                                        .map(
                                          (e) => Text(
                                            e.name!,
                                            style: const TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
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
