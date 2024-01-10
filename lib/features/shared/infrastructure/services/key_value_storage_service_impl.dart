import 'package:app_cafe/features/shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeyValueStorageServiceImpl implements KeyValueStorageService {
  Future<SharedPreferences> getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<T?> getValue<T>(String key) async {
    final preferences = await getSharedPreferences();

    switch (T) {
      case (int):
        preferences.getInt(key) as T;
        break;

      case (String):
        preferences.getString(key) as T;
        break;

      default:
        throw UnimplementedError(
            'GET KeyValue not implemented for type ${T.runtimeType}');
    }
  }

  @override
  Future<bool> removeKey(String key) async {
    final preferences = await getSharedPreferences();
    return await preferences.remove(key);
  }

  @override
  Future<void> setKeyValue<T>(String key, T value) async {
    final preferences = await getSharedPreferences();
    switch (T) {
      case int:
        preferences.setInt(key, value as int);
        break;
      case String:
        preferences.setString(key, value as String);
        break;
      default:
        throw UnimplementedError(
            'Set KeyValue not implemented for type ${T.runtimeType}');
    }
  }
}
