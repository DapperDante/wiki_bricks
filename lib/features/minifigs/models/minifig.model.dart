class MinifigModel {
  String setNum;
  String name;
  int numParts;
  String setImgUrl;
  String setUrl;
  DateTime lastModifiedDt;

  MinifigModel({
    required this.setNum,
    required this.name,
    required this.numParts,
    required this.setImgUrl,
    required this.setUrl,
    required this.lastModifiedDt,
  });

  factory MinifigModel.fromJson(Map<String, dynamic> json) {
    return MinifigModel(
      setNum: json['set_num'],
      name: json['name'],
      numParts: json['num_parts'],
      setImgUrl: json['set_img_url'],
      setUrl: json['set_url'],
      lastModifiedDt: DateTime.parse(json['last_modified_dt']),
    );
  }
}
