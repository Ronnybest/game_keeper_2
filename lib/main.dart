import 'package:dynamic_color/dynamic_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_keeper/app_observer.dart';
import 'package:game_keeper/core/injection/injections.dart';
import 'package:game_keeper/core/router/app_router.dart';
import 'package:game_keeper/core/utils/custom_loader.dart';
import 'package:game_keeper/core/utils/fast_cached_image.dart';
import 'package:game_keeper/core/utils/keyborad_dismisser.dart';
import 'package:game_keeper/firebase_options.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  await EasyLocalization.ensureInitialized();
  await GetIt.I.allReady();
  await GetIt.I<FastCachedNetworkInit>().init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  Bloc.observer = AppBlocObserver();
  runApp(
    EasyLocalization(
      useOnlyLangCode: true,
      supportedLocales: const [Locale('ru'), Locale('en')],
      fallbackLocale: const Locale('en'),
      path: 'assets/translations',
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return GlobalKeyboardDismisser(
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        child: DynamicColorBuilder(
          builder: (lightDynamic, darkDynamic) {
            return GlobalCustomLoader(
              child: MaterialApp.router(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                themeMode: ThemeMode.system,
                routerConfig: _appRouter.config(),
                theme: ThemeData(
                  colorScheme: lightDynamic?.harmonized(),
                  useMaterial3: true,
                  //backgroundColor: lightDynamic?.onBackground,
                  brightness: Brightness.light,
                  textTheme: GoogleFonts.golosTextTextTheme().apply(
                    bodyColor: lightDynamic?.onSurface,
                    decorationColor: lightDynamic?.onSurface,
                  ),
                  appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.transparent,
                      statusBarIconBrightness: Brightness.dark,
                    ),
                  ),
                ),
                darkTheme: ThemeData(
                  colorScheme: darkDynamic?.harmonized(),
                  useMaterial3: true,
                  //backgroundColor: lightDynamic?.onBackground,
                  brightness: Brightness.dark,
                  textTheme: GoogleFonts.golosTextTextTheme().apply(
                    bodyColor: darkDynamic?.onSurface,
                    decorationColor: darkDynamic?.onSurface,
                  ),
                  appBarTheme: const AppBarTheme(
                    elevation: 0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.transparent,
                      statusBarIconBrightness: Brightness.light,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
