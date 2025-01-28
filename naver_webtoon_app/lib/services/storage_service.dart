import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static Future<SharedPreferences> getPrefsInstance() async {
    return await SharedPreferences.getInstance();
  }

  static void setLikeToon(String id, bool isLike) async {
    final prefs = await getPrefsInstance();

    prefs.setBool('toon-$id', isLike);
  }

  static Future<bool> getLikeToon(String id) async {
    final prefs = await getPrefsInstance();

    return prefs.getBool('toon-$id') ?? false;
  }
}
