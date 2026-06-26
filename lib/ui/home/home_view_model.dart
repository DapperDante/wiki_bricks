import 'package:wiki_bricks/core/services/models/theme.model.dart';
import 'package:wiki_bricks/core/services/theme.service.dart';

class HomeViewModel {
  const HomeViewModel({required this._themeService});
  final ThemeService _themeService;
  Future<List<ThemeModel>> getThemes() {
    return _themeService.fetchThemes();
  }
}