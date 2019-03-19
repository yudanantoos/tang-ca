import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  final SharedPreferences _sharedPreferences;

  const LocalStorage(this._sharedPreferences);

  T getField<T>(String key, {T defaultValue}) => _sharedPreferences.get(key) as T ?? defaultValue;

  void setField<T>(String key, T value) {
    switch (T) {
      case bool:
        _sharedPreferences.setBool(key, value as bool);
        break;

      case String:
        _sharedPreferences.setString(key, value as String);
        break;

      case int:
        _sharedPreferences.setInt(key, value as int);
        break;

      case double:
        _sharedPreferences.setDouble(key, value as double);
        break;

      default:
    }
  }
}
