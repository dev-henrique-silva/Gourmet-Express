abstract class ILocalStorageService {
  Future<void> saveUidToLocalStorage(String value);
  Future<String?> getUidFromLocalStorage();
  Future<void> clear();
}
