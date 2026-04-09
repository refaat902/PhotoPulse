import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static saveString ({required String key , required String? value}) async {
    AndroidOptions getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );
    final storage = FlutterSecureStorage(aOptions: getAndroidOptions());
    await storage.write(key: key, value: value) ;
  }

  static Future<String?> getData ({required String key})async {
    AndroidOptions getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );
    final storage = FlutterSecureStorage(aOptions: getAndroidOptions());
    String? data = await storage.read(key: key) ;
    return data ;
  }

  static removeData ({required String key})async {
    AndroidOptions getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );
    final storage = FlutterSecureStorage(aOptions: getAndroidOptions());
    await storage.delete(key: key) ;

  }

}