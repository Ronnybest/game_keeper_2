import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_keeper/core/utils/exception_worker.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/model/game_achievements_model.dart';
import 'package:game_keeper/modules/games/game_view/logic/bloc/game_view_bloc.dart';
import 'package:game_keeper/modules/games/game_view/ui/widgets/game_achivement_tile.dart';
import 'package:game_keeper/ui/widgets/gk_appbar.dart';
import 'package:game_keeper/ui/widgets/gk_shimmer.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

@RoutePage()
class GameAchivementsListScreen extends StatefulWidget
    implements AutoRouteWrapper {
  const GameAchivementsListScreen(
      {super.key, required this.gameId, required this.gameName});
  final int gameId;
  final String gameName;
  @override
  State<GameAchivementsListScreen> createState() =>
      _GameAchivementsListScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GameViewBloc>(
          create: (_) => GetIt.I<GameViewBloc>(),
          child: this,
        ),
      ],
      child: this,
    );
  }
}

class _GameAchivementsListScreenState extends State<GameAchivementsListScreen> {
  int currentPage = 1;
  late PagingController<int, Result> _pagingController;

  @override
  void initState() {
    super.initState();
    _pagingController =
        PagingController(firstPageKey: 1, invisibleItemsThreshold: 6);
    _pagingController.addPageRequestListener(_fetchAchivements);
    // _fetchAchivements(1);
  }

  @override
  void dispose() {
    _pagingController.removePageRequestListener(_fetchAchivements);
    _pagingController.dispose();
    super.dispose();
  }

  void _fetchAchivements(int pageKey) {
    if (!mounted) return;
    BlocProvider.of<GameViewBloc>(context)
        .add(GameViewEvent.fetchPagingGameAchievements(widget.gameId, pageKey));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GKAppBar(
        title: widget.gameName,
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.sync(() {
            _pagingController.refresh();
          });
        },
        child: BlocListener<GameViewBloc, GameViewState>(
          listener: (context, state) {
            state.whenOrNull(
              errorPagingGameAchievements: (message) {
                GetIt.I<ExceptionWorker>().errorWorker(message, context);
              },
              loadedPagingGameAchievements: (gameAchivements) {
                final isLastPage = gameAchivements.results!.length < 10;
                if (isLastPage) {
                  _pagingController.appendLastPage(gameAchivements.results!);
                } else {
                  currentPage++;
                  final nextPageKey = currentPage;
                  _pagingController.appendPage(
                      gameAchivements.results!, nextPageKey);
                }
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: PagedListView<int, Result>(
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<Result>(
                  firstPageProgressIndicatorBuilder: (context) {
                    return const GKShimmerGenerator(
                      count: 10,
                      height: 65,
                      listPadding: EdgeInsets.symmetric(vertical: 13),
                    );
                  },
                  animateTransitions: true,
                  newPageProgressIndicatorBuilder: (context) {
                    return const GKShimmerGenerator(
                      count: 1,
                      height: 65,
                      listPadding: EdgeInsets.symmetric(vertical: 13),
                    );
                  },
                  itemBuilder: (context, item, index) {
                    return GameAchivementTile(
                      achivement: item,
                    );
                  },
                )),
          ),
        ),
      ),
    );
  }
}
