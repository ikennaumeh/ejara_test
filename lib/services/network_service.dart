import 'package:dio/dio.dart';
import 'package:ejara_test/services/environment.dart';
import 'package:ejara_test/services/interceptor/app_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class NetworkService{
  final _logger = Logger("NetworkService");
  late final Dio dio;

  static final String _baseUrl = Environment.current.baseUrl;

  NetworkService() {
    dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
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
    }
    dio.interceptors.add(AppInterceptor());
  }

  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await dio.get(
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

  void _handleError(DioException e){

  }
}