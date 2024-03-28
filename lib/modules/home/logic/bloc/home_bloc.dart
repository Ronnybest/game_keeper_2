import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_keeper/core/models/user_firestore.dart';
import 'package:game_keeper/core/utils/user_info_firestore.dart';
import 'package:game_keeper/modules/home/logic/api/model/games_list_model.dart';
import 'package:game_keeper/modules/home/logic/api/repository/home_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
part 'home_state.dart';
part 'home_event.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;
  HomeBloc(this._homeRepository) : super(const HomeState.initial()) {
    on<HomeEvent>(_onEvent);
  }

  Future<void> _onEvent(HomeEvent event, Emitter<HomeState> emit) {
    return event.map(fetchTrendingGames: (value) async {
      try {
        emit(const HomeState.loadingTrendingGames());
        DateTime currentDate = DateTime.now();
        DateTime startDate = currentDate.subtract(const Duration(days: 90));
        DateTime endDate = currentDate.add(const Duration(days: 550));
        String formattedStartDate = DateFormat('yyyy-MM-dd').format(startDate);
        String formattedEndDate = DateFormat('yyyy-MM-dd').format(endDate);
        var result = await _homeRepository.getTrendingGames(
          page: value.page ?? 1,
          pageSize: value.pageSize ?? 10,
          startDate: formattedStartDate,
          endDate: formattedEndDate,
        );
        emit(HomeState.loadedTrendingGames(result));
      } catch (e) {
        emit(HomeState.errorTrendingGames(e));
      }
    }, fetchUserData: (_FetchUserData value) async {
      try {
        emit(const HomeState.loadingUserData());
        var currentUser = FirebaseAuth.instance.currentUser;
        var user = await GetIt.I<UserInfoFirestore>().getUserInfo(currentUser!);
        if (user != null) {
          emit(HomeState.loadedUserData(user));
        } else {
          emit(const HomeState.errorUserData(
              'User not found')); // TODO add localization
        }
      } catch (e) {
        emit(HomeState.errorUserData(e));
      }
    }, updateUserData: (_UpdateUserData value) async {
      try {
        emit(const HomeState.loadingUpdateUserData());
        await GetIt.I<UserInfoFirestore>().updateUserInfo(value.user);
        emit(const HomeState.loadedUpdateUserData());
      } catch (e) {
        emit(HomeState.errorUpdateUserData(e));
      }
    });
  }
}
