import 'package:get_storage/get_storage.dart';

class LocalStorageService {
  static GetStorage box = GetStorage();
  static initStorage() async {
    await GetStorage.init();
  }

  static setString({required String key, required String value}) {
    box.write(key, value);
  }

  static String getString(String key) {
    return box.read(key);
  }
}
