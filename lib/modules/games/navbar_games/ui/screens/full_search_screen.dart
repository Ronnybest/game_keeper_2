import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_keeper/core/router/app_router.gr.dart';
import 'package:game_keeper/core/utils/exception_worker.dart';
import 'package:game_keeper/modules/games/navbar_games/logic/api/models/search_games_model.dart';
import 'package:game_keeper/modules/games/navbar_games/logic/bloc/games_bloc.dart';
import 'package:game_keeper/modules/games/navbar_games/ui/widgets/search_game_tile.dart';
import 'package:game_keeper/ui/widgets/gk_appbar.dart';
import 'package:game_keeper/ui/widgets/gk_shimmer.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

@RoutePage()
class FullSearchScreen extends StatefulWidget implements AutoRouteWrapper {
  const FullSearchScreen({super.key, required this.query});

  final String query;
  @override
  State<FullSearchScreen> createState() => _FullSearchScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GamesBloc>(
          create: (_) => GetIt.I<GamesBloc>(),
          child: this,
        ),
      ],
      child: this,
    );
  }
}

class _FullSearchScreenState extends State<FullSearchScreen> {
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
    BlocProvider.of<GamesBloc>(context)
        .add(GamesEvent.searchGamesPaging(query: widget.query, page: pageKey));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GKAppBar(
        title: widget.query,
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.sync(() {
            _pagingController.refresh();
          });
        },
        child: BlocListener<GamesBloc, GamesState>(
          listener: (context, state) {
            state.whenOrNull(
              searchPagingError: (message) {
                GetIt.I<ExceptionWorker>().errorWorker(message, context);
              },
              searchPagingLoaded: (searchResult) {
                final isLastPage = searchResult.results!.length < 10;
                if (isLastPage) {
                  _pagingController.appendLastPage(searchResult.results!);
                } else {
                  currentPage++;
                  final nextPageKey = currentPage;
                  _pagingController.appendPage(
                      searchResult.results!, nextPageKey);
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
                  return GestureDetector(
                    onTap: () {
                      AutoRouter.of(context)
                          .push(GameViewRoute(gameId: item.id!));
                    },
                    child: SearchGameTile(
                      game: item,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
