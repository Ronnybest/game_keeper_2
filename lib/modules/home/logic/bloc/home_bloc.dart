import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_event.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.initial()) {
    on<HomeEvent>((event, emit) {
      event.when(
        fetchTrendingGames: () {
          emit(const HomeState.loadingTrendingGames());
          // Fetch trending games
          emit(const HomeState.loadedTrendingGames());
        },
      );
    });
  }
}
