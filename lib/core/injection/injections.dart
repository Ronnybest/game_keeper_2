import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injections.config.dart';

final getIt = GetIt.instance;

// @InjectableInit(
//   initializerName: 'init', // default
//   preferRelativeImports: true, // default
//   asExtension: true, // default
// )
@InjectableInit()
void configureDependencies() {
  //getIt.registerSingleton<DemoScreenConstants>(DemoScreenConstants());
  getIt.init();
}
