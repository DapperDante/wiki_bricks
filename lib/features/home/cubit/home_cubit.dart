import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../themes/models/theme.model.dart';
import '../../themes/repositories/theme.repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ThemeRepository _repository;
  HomeCubit({required this._repository}) : super(HomeInitial());
  Future<void> getAllThemes() async {
    emit(HomeLoading());
    try {
      final themes = await _repository.fetchParentAllThemes();
      if (!isClosed) {
        emit(HomeLoaded(themes));
      }
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
