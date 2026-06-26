import 'package:dio/dio.dart';
import '/config/var.config.dart';

class ApiClient {
  late final Dio _dio;
  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: apiUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          // Add any request modifications here if needed
          requestOptions.headers['Authorization'] = 'key $apiKey';
          return handler.next(requestOptions);
        },
      ),
    );
  }
  Dio get client => _dio;
}
