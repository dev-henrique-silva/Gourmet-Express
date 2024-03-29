import 'package:gourmetexpress/app/services/local_storage_service/i_local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService implements ILocalStorageService {
  final String userIdentifier = 'Uid';

  @override
  Future<void> saveUidToLocalStorage(String value) async {
    final prefs = await SharedPreferences.getInstance();
    final key = userIdentifier;

    await prefs.setString(key, value);
  }

  @override
  Future<String?> getUidFromLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final key = userIdentifier;

    final savedString = prefs.getString(key);

    return savedString;
  }

  @override
  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    final key = userIdentifier;

    await prefs.remove(key);
  }
}
