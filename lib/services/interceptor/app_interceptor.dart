import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ejara_test/services/secure_storage_service.dart';
import 'package:ejara_test/services/service_locator.dart';
import 'package:ejara_test/services/utilities/utilities.dart';
import 'package:logging/logging.dart';

class AppInterceptor extends Interceptor with Utilities {
  final _logger = Logger("AppInterceptor");
  final _secureStorageService = serviceLocator.get<SecureStorageService>();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = await _secureStorageService.readAccessToken();
    _logger.info("Token: $token");

    if (isNotEmpty(token)) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    }

    options.headers.addAll({
      HttpHeaders.connectionHeader: 'keep-alive',
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      "api-key": "K[bb@c*heYNTOd[UVBmLevq0(",
      "client-id": "02d5f007e2",
      "app-version": "3.1.5",
      "app-platform": "android-test",
      "client": "android-test",
      "Accept-language": "en"
    });

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // implement onError
    super.onError(err, handler);
  }
}