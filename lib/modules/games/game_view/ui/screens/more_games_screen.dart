import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_keeper/core/constants/constants.dart';
import 'package:game_keeper/core/utils/exception_worker.dart';
import 'package:game_keeper/generated/locale.keys.g.dart';
import 'package:game_keeper/modules/games/game_view/ui/widgets/game_tile.dart';
import 'package:game_keeper/modules/home/logic/api/model/games_list_model.dart';
import 'package:game_keeper/modules/home/logic/bloc/home_bloc.dart';
import 'package:game_keeper/ui/widgets/gk_appbar.dart';
import 'package:game_keeper/ui/widgets/gk_shimmer.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

@RoutePage()
class MoreGamesScreen extends StatefulWidget implements AutoRouteWrapper {
  const MoreGamesScreen(
      {super.key, required this.gamesListModel, required this.eventProvider});
  final GamesListModel gamesListModel;
  final HomeEvent Function(int pageKey, int pageSize) eventProvider;

  @override
  State<MoreGamesScreen> createState() => _MoreGamesScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<HomeBloc>(
        create: (_) => GetIt.I<HomeBloc>(),
        child: this,
      ),
    ], child: this);
  }
}

class _MoreGamesScreenState extends State<MoreGamesScreen> {
  late PagingController<int, GameResult> _pagingController;
  late bool isInit;
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    isInit = true;
    _pagingController =
        PagingController(firstPageKey: 1, invisibleItemsThreshold: 6);
    _pagingController.addPageRequestListener(_fetchPage);
    //_fetchPage(1);
  }

  void _fetchPage(int pageKey) {
    if (!mounted) return;
    BlocProvider.of<HomeBloc>(context).add(
      widget.eventProvider.call(pageKey, AppConstants.pageSize),
    );
  }

  @override
  void dispose() {
    _pagingController.removePageRequestListener(_fetchPage);
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GKAppBar(
        title: LocaleKeys.home_trend_games.tr(),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.sync(() {
            _pagingController.refresh();
          });
        },
        child: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            state.whenOrNull(
              errorPaginationTrendingGames: (error) {
                GetIt.I<ExceptionWorker>().errorWorker(error, context);
              },
              loadedPaginationTrendingGames: (newResult) {
                final isLastPage =
                    newResult.results!.length < AppConstants.pageSize;
                if (isLastPage) {
                  _pagingController.appendLastPage(newResult.results!);
                } else {
                  currentPage++;
                  final nextPageKey = currentPage;
                  _pagingController.appendPage(newResult.results!, nextPageKey);
                }
              },
            );
          },
          child: PagedListView<int, GameResult>(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<GameResult>(
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
                return GameTile(game: item);
              },
            ),
          ),
        ),
      ),
    );
  }
}
