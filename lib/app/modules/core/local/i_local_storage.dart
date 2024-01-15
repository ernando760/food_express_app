abstract class ILocalStorage {
  Future<String?> get(String key);
  Future<void> save(String key, String value);
  Future<void> remove(String key);
}
