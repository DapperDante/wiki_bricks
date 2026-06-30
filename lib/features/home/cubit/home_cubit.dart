import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wiki_bricks/features/minifigs/models/minifig.model.dart';
import 'package:wiki_bricks/features/minifigs/repositories/minifig.repository.dart';
import 'package:wiki_bricks/features/sets/models/set.model.dart';
import 'package:wiki_bricks/features/sets/repositories/set.repository.dart';
import '../../themes/models/theme.model.dart';
import '../../themes/repositories/theme.repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ThemeRepository _themeRepository;
  final MinifigRepository _minifigRepository;
  final SetRepository _setRepository;
  HomeCubit({required this._themeRepository, required this._minifigRepository, required this._setRepository})
    : super(HomeInitial());
  Future<void> getAllData() async {
    emit(HomeLoading());
    try {
      final themes = await _themeRepository.fetchParentAllThemes();
      final minifigs = await _minifigRepository.fetchAllMinifigs(size: 4);
      final sets = await _setRepository.fetchAllSets(size: 4);
      if (!isClosed) {
        emit(HomeLoaded(themes, minifigs, sets));
      }
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
