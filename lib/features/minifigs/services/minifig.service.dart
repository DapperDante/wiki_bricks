import 'package:dio/dio.dart';

class MinifigService {
  MinifigService({required this._client});
  final Dio _client;
  final String _baseUrl = '/lego/minifigs';
  Future<Map<String, dynamic>> fetchAllMinifigs({int size = 10}) async {
    try {
      final response = await _client.get('$_baseUrl?page_size=$size');
      return response.data;
    } catch (e) {
      return Future.error(e);
    }
  }
}
