import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_keeper/core/utils/logger_init.dart';
import 'package:get_it/get_it.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    GetIt.I<AppLogger>().logger.i(change.toString());
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    GetIt.I<AppLogger>().logger.e(error.toString());
  }
}
