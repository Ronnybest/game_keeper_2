import 'package:dio/dio.dart';
import 'package:game_keeper/core/constants/constants.dart';
import 'package:game_keeper/core/network/core_config.dart';
import 'package:game_keeper/core/utils/logger_init.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';


@module
abstract class AppModule {
  @singleton
  @Named('baseRawgIoUrl')
  String get baseRawgIoUrl => ApiConstants.baseRawgIoUrl;

  @singleton
  @Named('baseNewsUrl')
  String get baseNewsUrl => ApiConstants.baseNewsUrl;
}

@singleton
class CoreApi {
  late final Dio _dio;
  late final Dio _rawgIoDio;
  late final Dio _newsDio;

  Dio get dio => _dio;
  Dio get rawgIoDio => _rawgIoDio;
  Dio get newsDio => _newsDio;

  CoreApi(CoreConfig config) {
    init(config);
  }

  static final baseInterceptor = QueuedInterceptorsWrapper(
    onRequest: (options, handler) async {
      GetIt.I<AppLogger>().logger.i('Dio Request started...');
      GetIt.I<AppLogger>().logger.d(
          'Request: ${options.method} ${options.uri}\n\nQuerry params: ${options.queryParameters}\n\nData: ${options.data}');
      handler.next(options);
    },
    onError: (error, handler) async {
      GetIt.I<AppLogger>().logger.e('Dio Request error: $error');
      handler.next(error);
    },
    onResponse: (response, handler) async {
      GetIt.I<AppLogger>().logger.i('Dio Request completed...');
      GetIt.I<AppLogger>().logger.d(
          'Response: ${response.statusCode} ${response.statusMessage}\n\nData: ${response.data}');
      handler.next(response);
    },
  );

  Future<void> init(CoreConfig config) async {
    _rawgIoDio = Dio();
    _newsDio = Dio();
    _dio = Dio();

    _rawgIoDio.options.baseUrl = config.baseRawgIoUrl;
    _newsDio.options.baseUrl = config.baseNewsUrl;
    _dio.options.baseUrl = config.baseRawgIoUrl;

    _rawgIoDio.options.connectTimeout = const Duration(seconds: 60);
    _newsDio.options.connectTimeout = const Duration(seconds: 60);
    _dio.options.connectTimeout = const Duration(seconds: 60);

    _rawgIoDio.options.receiveTimeout = const Duration(seconds: 60);
    _newsDio.options.receiveTimeout = const Duration(seconds: 60);
    _dio.options.receiveTimeout = const Duration(seconds: 60);

    _rawgIoDio.interceptors.add(baseInterceptor);
    _newsDio.interceptors.add(baseInterceptor);
    _dio.interceptors.add(baseInterceptor);
  }
}
