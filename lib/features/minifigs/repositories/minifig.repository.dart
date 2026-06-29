import '../models/minifig.model.dart';
import '../services/minifig.service.dart';

class MinifigRepository {
  MinifigRepository({required this._service});
  final MinifigService _service;
  Future<List<MinifigModel>> fetchAllMinifigs() async {
    try {
      final data = await _service.fetchAllMinifigs();
      final minifigs = (data['results'] as List)
          .map((minifig) => MinifigModel.fromJson(minifig))
          .toList();
      return minifigs;
    } catch (e) {
      return Future.error(e);
    }
  }
}
