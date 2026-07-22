import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const String settingsBox = 'settings_box';
  static const String favoritesBox = 'favorites_box';

  static Future<void> init() async {
    await Hive.openBox(settingsBox);
    await Hive.openBox(favoritesBox);
  }
}
