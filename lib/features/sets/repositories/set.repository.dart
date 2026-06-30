import 'package:wiki_bricks/features/sets/models/set.model.dart';
import 'package:wiki_bricks/features/sets/services/set.service.dart';

class SetRepository {
  SetRepository({required this._service});
  final SetService _service;
  Future<List<SetModel>> fetchAllSets({int size = 10}) async {
    try {
      final data = await _service.fetchAllSets(size: size);
      final sets = (data['results'] as List)
          .map((set) => SetModel.fromJson(set))
          .toList();
      return sets;
    } catch (e) {
      return Future.error(e);
    }
  }
}