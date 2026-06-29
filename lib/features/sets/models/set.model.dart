class SetModel {
    String setNum;
    String name;
    int year;
    int themeId;
    int numParts;
    String? setImgUrl;
    String setUrl;
    DateTime lastModifiedDt;

    SetModel({
        required this.setNum,
        required this.name,
        required this.year,
        required this.themeId,
        required this.numParts,
        this.setImgUrl,
        required this.setUrl,
        required this.lastModifiedDt,
    });
    factory SetModel.fromJson(Map<String, dynamic> json) => SetModel(
        setNum: json["set_num"],
        name: json["name"],
        year: json["year"],
        themeId: json["theme_id"],
        numParts: json["num_parts"],
        setImgUrl: json["set_img_url"],
        setUrl: json["set_url"],
        lastModifiedDt: DateTime.parse(json["last_modified_dt"]),
    );
}
