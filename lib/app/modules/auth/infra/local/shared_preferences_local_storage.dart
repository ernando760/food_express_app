import 'package:flutter/material.dart';
import 'package:food_express_app/app/modules/auth/domain/infra/local/i_local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLocalStorage extends ILocalStorage {
  @override
  Future<void> remove(String key) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.remove(key);
    } catch (e, s) {
      debugPrint("ERROR: $e");
      debugPrint("STACKTRACE: $s");
    }
  }

  @override
  Future<String?> get(String key) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences.getString(key);
    } catch (e, s) {
      debugPrint("ERROR: $e");
      debugPrint("STACKTRACE: $s");

      return null;
    }
  }

  @override
  Future<void> save(String key, String value) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setString(key, value);
    } catch (e, s) {
      debugPrint("ERROR: $e");
      debugPrint("STACKTRACE: $s");
    }
  }
}
