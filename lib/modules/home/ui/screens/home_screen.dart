import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_keeper/core/models/user_firestore.dart';
import 'package:game_keeper/core/router/app_router.gr.dart';
import 'package:game_keeper/generated/locale.keys.g.dart';
import 'package:game_keeper/modules/home/logic/bloc/home_bloc.dart';
import 'package:game_keeper/modules/home/ui/widgets/trending_games.dart';
import 'package:game_keeper/ui/widgets/gk_appbar.dart';
import 'package:game_keeper/ui/widgets/gk_shimmer.dart';
import 'package:get_it/get_it.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class HomeScreen extends StatefulWidget implements AutoRouteWrapper {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => GetIt.I<HomeBloc>(),
        child: this,
      ),
    ], child: this);
  }
}

class _HomeScreenState extends State<HomeScreen> {
  late User user;
  UserFirestore userFirestore = UserFirestore();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(const HomeEvent.fetchUserData());
    user = FirebaseAuth.instance.currentUser!;
    //_onRefresh();
  }

  Future<void> _onRefresh() async {
    BlocProvider.of<HomeBloc>(context).add(
      const HomeEvent.fetchTrendingGames(null, null),
    );
  }

  String getName() {
    if (userFirestore.name == null || userFirestore.name!.isEmpty) {
      return LocaleKeys.profile_default_username.tr();
    } else {
      return userFirestore.name!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              loadingUserData: () {
                context.loaderOverlay.show();
              },
              loadedUserData: (user) {
                context.loaderOverlay.hide();
                setState(() {
                  userFirestore = user;
                });
                _onRefresh();
              },
              errorUserData: (error) {
                context.loaderOverlay.hide();
                ScaffoldMessenger.of(context).showSnackBar(
                  // TODO add custom snackbar
                  SnackBar(
                    content: Text(error.toString()),
                  ),
                );
              },
            );
          },
        ),
      ],
      child: RefreshIndicator.adaptive(
        onRefresh: _onRefresh,
        child: Scaffold(
          appBar: GKAppBar(
            title: LocaleKeys.home_title.tr(
              namedArgs: {
                'name': getName(),
              },
            ),
          ),
          body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15,
                              left: 15,
                              right: 15,
                            ),
                            child: ShimmerElement(
                              width: double.infinity,
                              height: 40,
                              radius: BorderRadius.circular(12),
                            ),
                          ),
                          GKShimmerGenerator(
                            count: 5,
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 10),
                            height: 200,
                            width: 300.w,
                            axisDirection: Axis.horizontal,
                          ),
                        ],
                      ),
                      loadedTrendingGames: (result) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.router.push(
                                  MoreGamesRoute(gamesListModel: result),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 15, bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      LocaleKeys.home_trend_games.tr(),
                                      style: const TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            TrendigGames(gamesListModel: result),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
