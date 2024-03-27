import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_keeper/modules/home/logic/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

class FullGameListScreen extends StatefulWidget implements AutoRouteWrapper {
  const FullGameListScreen({super.key});

  @override
  State<FullGameListScreen> createState() => _FullGameListScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<HomeBloc>(),
      child: this,
    );
  }
}

class _FullGameListScreenState extends State<FullGameListScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
