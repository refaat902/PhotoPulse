import 'package:dio/dio.dart';

import '../network_urls/network_urls.dart';

class DioProvider {
  static final DioProvider _instance = DioProvider._internal();

  static DioProvider get instance => _instance;
  bool _initialized = false;
  late Dio dio;

  DioProvider._internal();

  Dio get() {
    if (!_initialized) _init();
    return dio;
  }

  void _init() {
    dio = Dio(
      BaseOptions(

        baseUrl: NetworkURLS.baseURL,
        receiveDataWhenStatusError: true,
        connectTimeout:  const Duration(milliseconds: 50000),
      ),
    );

    _initialized = true;
  }
}
