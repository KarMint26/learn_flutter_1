class ResponseModel {
  String status;
  String message;
  dynamic data;
  dynamic errors;

  ResponseModel({
    required this.status,
    required this.message,
    this.data,
    this.errors
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json){
    return ResponseModel(
      message: json["status"],
      status: json["status"],
      data: json["data"],
      errors: json["errors"]
    );
  }
}