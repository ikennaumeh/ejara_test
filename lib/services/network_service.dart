import 'package:dio/dio.dart';
import 'package:ejara_test/services/interceptor/app_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class NetworkService {
  final _logger = Logger("NetworkService");
  late final Dio dio;
  late final Dio dio2;

  final String _baseUrlV1 = "https://testbox-nellys-coin.ejaraapis.xyz/api/v1";
  final String _baseUrlV2 = "https://testbox-nellys-coin.ejaraapis.xyz/api/v2";

  NetworkService() {
    dio = Dio(
      BaseOptions(
        baseUrl: _baseUrlV1,
        connectTimeout: const Duration(seconds: 30),
      ),
    );
    dio2 = Dio(
      BaseOptions(
        baseUrl: _baseUrlV2,
        connectTimeout: const Duration(seconds: 30),
      ),
    );
    if (kDebugMode) {
      dio.interceptors.addAll([
        LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: false,
          request: false,
          requestBody: true,
        ),
        AppInterceptor(),
      ]);
      dio2.interceptors.addAll([
        LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: false,
          request: false,
          requestBody: true,
        ),
        AppInterceptor(),
      ]);
    }
    dio.interceptors.add(AppInterceptor());
    dio2.interceptors.add(AppInterceptor());
  }

  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await dio2.get(
        path,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    } catch (e, s) {
      _logger.severe('Could not make a request to this path: $path', e, s);
    }
  }

  Future post(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    } catch (e, s) {
      _logger.severe('Could not make a request to this path: $path', e, s);
    }
  }

  void _handleError(DioException e) {}
}
