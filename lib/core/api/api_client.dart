import 'package:dio/dio.dart';

class ApiClient {
  late final Dio _dio;
  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://rebrickable.com/api/v3',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }
  Dio get client => _dio;
}