import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../models/set.model.dart';
import '../repositories/set.repository.dart';

part 'sets_state.dart';

class SetsCubit extends Cubit<SetsState> {
  final SetRepository _repository;
  SetsCubit({required this._repository}) : super(SetsInitial());
  Future<void> getAllSets() async {
    emit(SetsLoading());
    try {
      final sets = await _repository.fetchAllSets();
      emit(SetsLoaded(sets));
    } catch (e) {
      emit(SetsError(e.toString()));
    }
  }
}
