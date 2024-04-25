import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_keeper/core/utils/exception_widget.dart';
import 'package:game_keeper/core/utils/exception_worker.dart';
import 'package:game_keeper/modules/games/game_view/logic/bloc/game_view_bloc.dart';
import 'package:game_keeper/ui/widgets/gk_appbar.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class GameDeveloperInfoScreen extends StatefulWidget
    implements AutoRouteWrapper {
  const GameDeveloperInfoScreen(
      {super.key, required this.developerId, required this.developerName});
  final int developerId;
  final String developerName;
  @override
  State<GameDeveloperInfoScreen> createState() =>
      _GameDeveloperInfoScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.I<GameViewBloc>(),
          child: this,
        ),
      ],
      child: this,
    );
  }
}

class _GameDeveloperInfoScreenState extends State<GameDeveloperInfoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<GameViewBloc>(context).add(
      GameViewEvent.fetchGameDeveloperInfo(widget.developerId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GKAppBar(),
      body: BlocListener<GameViewBloc, GameViewState>(
        listener: (context, state) {
          state.whenOrNull(
            errorGameDeveloperInfo: (message) {
              GetIt.I<ExceptionWorker>().errorWorker(message, context);
            },
            errorGamesByDeveloperPaging: (message) {
              GetIt.I<ExceptionWorker>().errorWorker(message, context);
            },
          );
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<GameViewBloc, GameViewState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loadingGameDeveloperInfo: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    loadedGameDeveloperInfo: (developer) {
                      return Column(
                        children: [
                          Text(developer.name!),
                          Text(developer.gamesCount.toString()),
                          Text(developer.description.toString()),
                        ],
                      );
                    },
                    errorGameDeveloperInfo: (message) {
                      return Center(
                        child: ExceptionWidget(
                          message: message.message,
                          onRetry: () {
                            BlocProvider.of<GameViewBloc>(context).add(
                              GameViewEvent.fetchGameDeveloperInfo(widget.developerId),
                            );
                          },
                        ),
                      );
                    },
                    orElse: () {
                      return const SizedBox();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
