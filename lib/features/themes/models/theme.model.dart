class ThemeModel {
  final int id;
  final String name;
  final int? parentId;

  ThemeModel({
    required this.id,
    required this.name,
    this.parentId,
  });

  factory ThemeModel.fromJson(Map<String, dynamic> json) {
    return ThemeModel(
      id: json['id'] as int,
      name: json['name'] as String,
      parentId: json['parent_id'] as int?,
    );
  }
}