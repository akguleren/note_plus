class BaseResponseModel<T> {
  BaseResponseModel({
    this.message,
    this.type,
    this.data,
  });

  final String? message;
  final bool? type;
  T? data;

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) {
    return BaseResponseModel(
      message: json["message"],
      type: json["type"],
      data: json["data"],
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "type": type,
        "data": data,
      };
}
