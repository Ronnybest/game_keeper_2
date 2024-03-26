import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ClearAllData {
  Future<void> clearAllData() async {
    // Clear all data
    FastCachedImageConfig.clearAllCachedImages();
  }
}
