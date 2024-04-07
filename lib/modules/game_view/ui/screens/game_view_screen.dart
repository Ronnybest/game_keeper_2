import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_keeper/core/utils/exception_worker.dart';
import 'package:game_keeper/modules/game_view/logic/bloc/game_view_bloc.dart';
import 'package:game_keeper/ui/widgets/gk_appbar.dart';
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
        appBar: const GKAppBar(),
        body: BlocConsumer<GameViewBloc, GameViewState>(
          listener: (context, state) {
            state.maybeWhen(
                orElse: () {},
                errorGame: (error) {
                  GetIt.I<ExceptionWorker>().errorWorker(error, context);
                });
          },
          builder: (context, state) {
            return state.maybeWhen(
                orElse: () => const Center(child: CircularProgressIndicator()),
                loadedGame: (game) {
                  return Column(
                    children: [
                      Container(
                        width: 60,
                        height: 20,
                        color: Colors.red,
                      ),
                    ],
                  );
                },
                errorGame: (error) {
                  return Center(
                    child: Text('Error: $error'),
                  );
                });
          },
        ));
  }
}
