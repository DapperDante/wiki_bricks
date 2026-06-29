import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../models/minifig.model.dart';
import '../repositories/minifig.repository.dart';

part 'minifigs_state.dart';

class MinifigsCubit extends Cubit<MinifigsState> {
  final MinifigRepository _repository;
  MinifigsCubit({required this._repository}) : super(MinifigsInitial());
  Future<void> getAllMinifigs() async {
    emit(MinifigsLoading());
    try {
      final minifigs = await _repository.fetchAllMinifigs();
      emit(MinifigsLoaded(minifigs));
    } catch (e) {
      emit(MinifigsError(e.toString()));
    }
  }
}
