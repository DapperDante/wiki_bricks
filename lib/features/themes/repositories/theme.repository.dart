import '../models/theme.model.dart';
import '../services/theme.service.dart';

class ThemeRepository {
  ThemeRepository({required this._service});
  final ThemeService _service;
  Future<List<ThemeModel>> fetchParentAllThemes() async {
    try{
      final data = await _service.fetchAllThemes();
      final themes = (data['results'] as List)
          .map((theme) => ThemeModel.fromJson(theme))
          .toList();
      return themes.where((theme) => theme.parentId == null).toList();
    } catch(e){
      return Future.error(e);
    }  
  }
}