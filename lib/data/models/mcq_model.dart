class McqModel {
  McqModel({
    this.status,
    this.data,
    this.message,
  });

  int status;
  Data data;
  String message;

  factory McqModel.fromJson(Map<String, dynamic> json) => McqModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data();

  Map<String, dynamic> toJson() => {};
}
