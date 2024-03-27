import 'package:injectable/injectable.dart';

@singleton
class CoreConfig {
  final String _baseRawgIoUrl;
  final String _baseNewsUrl;
  CoreConfig(
    @Named('baseRawgIoUrl') this._baseRawgIoUrl,
    @Named('baseNewsUrl') this._baseNewsUrl,
  );

  String get baseRawgIoUrl => _baseRawgIoUrl;
  String get baseNewsUrl => _baseNewsUrl;
}
