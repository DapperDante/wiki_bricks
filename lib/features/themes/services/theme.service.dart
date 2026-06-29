import 'package:dio/dio.dart';

class ThemeService {
  ThemeService({required this._client});
  final Dio _client;
  final String _baseUrl = '/lego/themes';
  Future<Map<String, dynamic>> fetchAllThemes() async {
    try {
      final response = await _client.get(_baseUrl);
      return response.data;
    } catch (e) {
      return Future.error(e);
    }
  }
}