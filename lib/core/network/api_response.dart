
import '../constants/app_constants.dart';

class ApiResponse<T> {
  final bool? status;
  final String? message;
  final List<T>? dataList;
  final T? data;
  final int? statusCode;
  final bool? showMessageToUser;

  ApiResponse({
    this.status,
    this.message,
    this.data,
    this.dataList,
    this.statusCode,
    this.showMessageToUser,
  });

  factory ApiResponse.fromJsonDataList({
    required bool isStringList,
    required Map<String, dynamic> json,
    required T Function(dynamic)? fromJsonT,
  }) {
    if (AppConstants.isStgOrDevOrMock) {
      var dataList;
      if (isStringList) {
        dataList = json['data'].cast<String>();
      } else {
        if (json['data'] is List) {
          dataList =
              (json['data'] as List).map((item) => fromJsonT!(item)).toList();
        } else {
          try {
            dataList = (json['data']["records"] as List)
                .map((item) => fromJsonT!(item))
                .toList();
          } catch (error) {
            dataList = <T>[];
          }
        }
      }
      return ApiResponse(
        status: json['status'],
        message: json['message'],
        dataList: dataList,
        statusCode: json['statusCode'],
        showMessageToUser: json['showMessageToUser'],
      );
    } else {
      var dataList;
      print(json);
      var data = json["data"];

      if (isStringList) {
        dataList = data['result'].cast<String>();
      } else {
        if (data['result'] is List) {
          dataList =
              (data['result'] as List).map((item) => fromJsonT!(item)).toList();
        } else {
          try {
            dataList = (data['result']["records"] as List)
                .map((item) => fromJsonT!(item))
                .toList();
          } catch (error) {
            print(error);
            dataList = <T>[];
          }
        }
      }
      return ApiResponse(
        status: data['responseCode'] == "1",
        message: data['responseMessage'],
        dataList: dataList,
        statusCode: json["statusDetails"]['code'],
        showMessageToUser: data['showMessageToUser'],
      );
    }
  }

  factory ApiResponse.fromJsonData({
    required Map<String, dynamic> json,
    T Function(dynamic)? fromJsonT,
  }) {
    if (AppConstants.isStgOrDevOrMock) {
      return ApiResponse(
        status: json['status'],
        message: json['message'],
        data: (json["data"] is! bool)
            ? json["data"] != ""
            ? fromJsonT != null
            ? fromJsonT(json["data"])
            : json["data"]
            : null
            : null,
        statusCode: json['statusCode'],
        showMessageToUser: json['showMessageToUser'],
      );
    } else {
      var data = json["data"];

      return ApiResponse(
        status: data['responseCode'] == "1",
        message: data['responseMessage'],
        data: (data['result'] is! bool)
            ? data['result'] != ""
            ? fromJsonT != null
            ? fromJsonT(data['result'])
            : data['result']
            : null
            : null,
        statusCode: json["statusDetails"]['code'],
        showMessageToUser: data['showMessageToUser'],
      );
    }
  }

  factory ApiResponse.fromJsonString({
    required Map<String, dynamic> json,
  }) {
    if (AppConstants.isStgOrDevOrMock) {
      return ApiResponse(
        status: json['status'],
        message: json['message'],
        data: json["data"],
        statusCode: json['statusCode'],
        showMessageToUser: json['showMessageToUser'],
      );
    } else {
      var data = json["data"];
      return ApiResponse(
        status: data['responseCode'] == "1",
        message: data['responseMessage'],
        data: data['result'],
        statusCode: json["statusDetails"]['code'],
        showMessageToUser: data['showMessageToUser'],
      );
    }
  }

  factory ApiResponse.fromJsonError({
    required Map<String, dynamic> json,
  }) {
    if (AppConstants.isStgOrDevOrMock) {
      return ApiResponse(
        status: json['status'],
        message: json['message'],
        statusCode: json['statusCode'],
        showMessageToUser: json['showMessageToUser'],
      );
    } else {
      var data = json["data"];
      return ApiResponse(
        status: data['responseCode'] == "1",
        message: data['responseMessage'],
        statusCode: json["statusDetails"]['code'],
        showMessageToUser: data['showMessageToUser'],
      );
    }
  }
}
