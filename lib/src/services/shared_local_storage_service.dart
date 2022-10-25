import 'package:pregue_a_palavra/src/interfaces/local_storage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLocalStorageService implements ILocalStorage {
  @override
  Future delete(String key) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  @override
  Future get(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  @override
  Future put(String key, String value) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
}
