import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photopulse/core/network/network_urls/network_urls.dart';
import 'dio_provider.dart';
import 'dio_service.dart';

class DioServiceImpl implements DioService {
  @override
  DioProvider dioProvider;

  static SecurityContext? securityContext;

  DioServiceImpl({required this.dioProvider});

  @override
  Future<Response> get({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    String? apiToken,
    CancelToken? cancelToken,
    Duration? timeOut,
    bool isMultipart = false,
    // ar or en
    String language = "ar",
  }) async {
    final dio = dioProvider.get();

    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }

    dio.options.baseUrl = base ?? NetworkURLS.baseURL;

    final headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      'Accept-Language': language,
    };
    if (apiToken != null) {
      headers['Authorization'] = apiToken;
    }
    if (token != null) {
      headers['Authorization'] = 'Token $token';
    }
    dio.options.headers = headers;

    Future.wait([loadCertificateForSSLPinning()]);
    HttpClient httpClient = HttpClient(context: securityContext);
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) {
          return false;
        };
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
        httpClient;

    debugPrint('URL => ${dio.options.baseUrl + endPoint}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $data');
    debugPrint('Query => $query');
    return await dio.get(
      endPoint,
      queryParameters: query,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response> post({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    String? apiToken,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    Duration? timeOut,
    bool isMultipart = false,
    String language = "ar",
  }) async {
    final dio = dioProvider.get();

    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }

    dio.options.baseUrl = base ?? NetworkURLS.baseURL;

    final headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      'Accept-Language': language,
    };
    if (apiToken != null) {
      headers['Authorization'] = apiToken;
    }
    if (token != null) {
      headers['Authorization'] = 'Token $token';
    }
    dio.options.headers = headers;

    Future.wait([loadCertificateForSSLPinning()]);
    HttpClient httpClient = HttpClient(context: securityContext);
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) {
          return false;
        };
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
        httpClient;

    debugPrint('URL => ${dio.options.baseUrl + endPoint}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $data');
    debugPrint('Query => $query');

    return await dio.post(
      endPoint,
      data: data,
      queryParameters: query,
      onSendProgress: progressCallback,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response> patch({
    String? base,
    required String endPoint,
    data,
    query,
    String? token,
    String? apiToken,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    Duration? timeOut,
    String language = "ar",
    bool isMultipart = false,
  }) async {
    final dio = dioProvider.get();

    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }

    dio.options.baseUrl = base ?? NetworkURLS.baseURL;

    final headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      'Accept-Language': language,
    };
    if (apiToken != null) {
      headers['Authorization'] = apiToken;
    }
    if (token != null) {
      headers['Authorization'] = 'Token $token';
    }
    dio.options.headers = headers;

    Future.wait([loadCertificateForSSLPinning()]);
    HttpClient httpClient = HttpClient(context: securityContext);
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) {
          return false;
        };
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
        httpClient;

    debugPrint('URL => ${dio.options.baseUrl + endPoint}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $data');
    debugPrint('Query => $query');

    return await dio.patch(
      endPoint,
      data: data,
      queryParameters: query,
      onSendProgress: progressCallback,
      cancelToken: cancelToken,
    );
  }

  static Future<void> loadCertificateForSSLPinning() async {
    final ByteData data = await rootBundle.load(
      'assets/certificate/neqabty.pem',
    );
    SecurityContext secContext = SecurityContext(withTrustedRoots: false);
    secContext.setTrustedCertificatesBytes(data.buffer.asUint8List());
    securityContext = secContext;
  }
}
