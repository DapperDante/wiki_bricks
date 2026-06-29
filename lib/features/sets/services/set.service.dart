import 'package:dio/dio.dart';

class SetService {
  SetService({required this._client});
  final Dio _client;
  final String _baseUrl = '/lego/sets';
  Future<Map<String, dynamic>> fetchAllSets() async {
    try{
      final response = await _client.get(_baseUrl);
      return response.data;
    } catch (e) {
      return Future.error(e);
    }
  }
}