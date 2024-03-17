import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SharedPrefencesUtil {
  Future<SharedPreferences> sharedPreferencesInit() async {
    return await SharedPreferences.getInstance();
  }
}
