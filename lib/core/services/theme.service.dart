import 'package:dio/dio.dart';
import 'package:wiki_bricks/core/services/models/theme.model.dart';

import 'service.dart';

class ThemeService extends Service{
  ThemeService({required this.client});
  @override
  Dio client;
  @override
  String baseUrl = '/lego/themes';
  Future<List<ThemeModel>> fetchThemes() async {
    try{
      final response = await client.get(baseUrl);
      final data = response.data['results'] as List;
      final items = data.map((e) => ThemeModel.fromJson(e)).where((e) => e.parentId == null).toList();
      return items;
    } catch (e) {
      return [];
    }
  }
}