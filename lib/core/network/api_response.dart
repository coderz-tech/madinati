import '../constants/app_constants.dart';

class ApiResponse<T> {
  // final bool? status;
  // final String? message;
  final List<T>? dataList;
  final T? data;

  // final int? statusCode;
  final bool? showMessageToUser;

  ApiResponse({
    // this.status,
    // this.message,
    this.data,
    this.dataList,
    // this.statusCode,
    this.showMessageToUser,
  });

  factory ApiResponse.fromJsonDataList({
    required bool isStringList,
    required Map<String, dynamic> json,
    required T Function(dynamic)? fromJsonT,
  }) {
    var dataList;
    if (isStringList) {
      dataList = json['data'].cast<String>();
    } else {
      if (json['data'] is List) {
        dataList =
            (json['data'] as List).map((item) => fromJsonT!(item)).toList();
      } else {
        try {
          dataList =
              (json['data']["results"] as List)
                  .map((item) => fromJsonT!(item))
                  .toList();
        } catch (error) {
          dataList = <T>[];
        }
      }
    }
    return ApiResponse(
      // status: json['status'],
      // message: json['message'],
      dataList: dataList,
      // statusCode: json['statusCode'],
      showMessageToUser: json['showMessageToUser'],
    );
  }

  factory ApiResponse.fromJsonData({
    required Map<String, dynamic> json,
    T Function(dynamic)? fromJsonT,
  }) {
    return ApiResponse(
      data:
          json["data"] != null && json["data"] is! bool && json["data"] != ""
              ? (fromJsonT != null ? fromJsonT(json["data"]) : json["data"])
              : null,
      showMessageToUser: json['showMessageToUser'],
    );
  }

  factory ApiResponse.fromJsonString({required Map<String, dynamic> json}) {
    return ApiResponse(
      // status: json['status'],
      // message: json['message'],
      data: json["data"],
      // statusCode: json['statusCode'],
      showMessageToUser: json['showMessageToUser'],
    );
  }

  factory ApiResponse.fromJsonError({required Map<String, dynamic> json}) {
    return ApiResponse(
      // status: json['status'],
      // message: json['message'],
      // statusCode: json['statusCode'],
      showMessageToUser: json['showMessageToUser'],
    );
  }
}
