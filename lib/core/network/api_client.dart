import 'dart:convert';
import 'dart:developer';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:http/http.dart' as http;

import '../constants/app_constants.dart';
import '../errors/server_exceptions.dart';
import '../locale/presentation/cubit/locale_cubit.dart';
import '../utils/secure_storage_helper.dart';
import 'api_response.dart';

class ApiClient {
  static Future<ApiResponse<T>> getData<T>({
    required String endpoint,
    T Function(dynamic data)? fromJsonT,
  }) async {
    print('${AppConstants.API_URL}$endpoint');
    try {
      final response = await http.get(
        Uri.parse('${AppConstants.API_URL}$endpoint'),
        headers: {
          "Authorization":
          "Bearer ${await SecureStorageHelper().getPrefString(key: AppConstants.ACCESS_TOKEN, defaultValue: "")}",
          "Accept-Language": await LocaleCubit.getLangSharedPrefForApi(),
        },
      );
      if (response.statusCode == 200) {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        Map<String, dynamic> jsonBody = json.decode(decodedResponse);

        log(jsonBody.toString());
        return ApiResponse.fromJsonData(json: jsonBody, fromJsonT: fromJsonT);
      } else if (response.statusCode == 400) {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);

        log(data);

        return ApiResponse.fromJsonError(json: data);
      } else {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);
        print(data);
        ApiResponse apiResponse = ApiResponse.fromJsonError(json: data);
        print(apiResponse.statusCode.toString());
        throw ServerException(
          status: apiResponse.status,
          showMessageToUser: apiResponse.showMessageToUser,
          message: apiResponse.message,
          statusCode: apiResponse.statusCode,
        );
      }
    } catch (error) {
      print(error.toString());
      throw ServerException(
        status: false,
        showMessageToUser: false,
        message: error.toString(),
      );
    }
  }

  static Future<ApiResponse<T>> getDataList<T>({
    required String endpoint,
    bool isStringList = false,
    T Function(dynamic data)? fromJsonT,
  }) async {
    print('${AppConstants.API_URL}$endpoint');
    try {
      final response = await http.get(
        Uri.parse('${AppConstants.API_URL}$endpoint'),
        headers: {
          "Accept-Language": await LocaleCubit.getLangSharedPrefForApi(),
          "Authorization":
          "Bearer ${await SecureStorageHelper().getPrefString(key: AppConstants.ACCESS_TOKEN, defaultValue: "")}",
        },
      );
      if (response.statusCode == 200) {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);

        return ApiResponse.fromJsonDataList(
          json: data,
          fromJsonT: fromJsonT,
          isStringList: isStringList,
        );
      } else if (response.statusCode == 400) {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);

        print(data);

        return ApiResponse.fromJsonError(json: data);
      } else {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);

        ApiResponse apiResponse = ApiResponse.fromJsonError(json: data);
        throw ServerException(
          status: apiResponse.status,
          showMessageToUser: apiResponse.showMessageToUser,
          message: apiResponse.message,
          statusCode: apiResponse.statusCode,
        );
      }
    } catch (error) {
      print(error.toString());
      throw ServerException(
        status: false,
        showMessageToUser: false,
        message: error.toString(),
      );
    }
  }

  static Future<ApiResponse<T>> postData<T>({
    required String endpoint,
    Map<String, dynamic>? body,
    T Function(dynamic data)? fromJsonT,
  }) async {
    try {
      print('${AppConstants.API_URL}$endpoint');
      print("body = ${jsonEncode(body)}");
      final response = await http.post(
        Uri.parse('${AppConstants.API_URL}$endpoint'),
        headers: {
          "Accept-Language": await LocaleCubit.getLangSharedPrefForApi(),
          'Content-Type': 'application/json',
          "Authorization":
          "Bearer ${await SecureStorageHelper().getPrefString(key: AppConstants.ACCESS_TOKEN, defaultValue: "")}",
        },
        body: body != null ? jsonEncode(body) : null,
      );
      print(response.body);
      if (response.statusCode == 200) {
        final String decodedResponse = utf8.decode(response.bodyBytes);

        final data = json.decode(decodedResponse);
        print(data);
        return ApiResponse.fromJsonData(json: data, fromJsonT: fromJsonT);
      } else if (response.statusCode == 400) {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);

        print(data);

        return ApiResponse.fromJsonError(json: data);
      } else {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);
        ApiResponse apiResponse = ApiResponse.fromJsonError(json: data);
        print(apiResponse.statusCode);
        throw ServerException(
          status: apiResponse.status,
          showMessageToUser: apiResponse.showMessageToUser,
          message: apiResponse.message,
          statusCode: apiResponse.statusCode,
        );
      }
    } catch (error) {
      print(error.toString());
      throw ServerException(
        status: false,
        showMessageToUser: false,
        message: error.toString(),
      );
    }
  }

  static Future<ApiResponse<T>> postMultiPartData<T>({
    required Map<String, String> fields,
    required String endpoint,
    required List<http.MultipartFile> files,
    required T Function(dynamic data) fromJsonT,
  }) async {
    print('${AppConstants.API_URL}$endpoint');
    print("body = ${jsonEncode(fields)}");
    try {
      var request = http.MultipartRequest(
          "POST", Uri.parse("${AppConstants.API_URL}$endpoint"));
      request.headers["Authorization"] =
      "Bearer ${await SecureStorageHelper().getPrefString(key: AppConstants.ACCESS_TOKEN, defaultValue: "")}";
      request.headers["Accept-Language"] =
      await LocaleCubit.getLangSharedPrefForApi();

      for (var field in fields.entries) {
        var key = field.key;
        var value = field.value;
        request.fields[key] = value;
      }

      for (http.MultipartFile file in files) {
        request.files.add(file);
      }

      final response = await http.Response.fromStream(await request.send());

      print("response.body = ${response.body} ");

      if (response.statusCode == 200) {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);
        return ApiResponse.fromJsonData(json: data, fromJsonT: fromJsonT);
      } else if (response.statusCode == 400) {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);

        print(data);

        return ApiResponse.fromJsonError(json: data);
      } else {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);

        ApiResponse apiResponse = ApiResponse.fromJsonError(json: data);
        throw ServerException(
          status: apiResponse.status,
          showMessageToUser: apiResponse.showMessageToUser,
          message: apiResponse.message,
          statusCode: apiResponse.statusCode,
        );
      }
    } catch (error) {
      throw ServerException(
        status: false,
        showMessageToUser: false,
        message: error.toString(),
      );
    }
  }

  static Future<ApiResponse<T>> postDataString<T>({
    required String endpoint,
    required Map<String, dynamic> body,
  }) async {
    log('${AppConstants.API_URL}$endpoint');
    log("body = ${jsonEncode(body)}");
    DateTime now = DateTime.now();
    DateTime oneMonthLater = DateTime(
        now.year, now.month + 1, now.day, now.hour, now.minute, now.second);
    int timestampOneMonthLater = oneMonthLater.millisecondsSinceEpoch ~/ 1000;

    final jwt = JWT(
      {
        "Scope": ["WasteManagement.API"],
        "Language": await LocaleCubit.getLangSharedPrefForApi(),
        "exp": timestampOneMonthLater,
        "iss": AppConstants.issuer,
        "aud": AppConstants.issuer
      },
      issuer: AppConstants.issuer,
    );

    final token = jwt.sign(SecretKey(AppConstants.issuer));
    log("token = $token");
    log("jwt.issuer = ${jwt.issuer}");
    log("jwt.subject = ${jwt.subject}");
    log("jwt.audience = ${jwt.audience}");
    log("jwt.payload = ${jwt.payload}");
    log("jwt.header = ${jwt.header}");

    try {
      final response = await http.post(
        Uri.parse('${AppConstants.API_URL}$endpoint'),
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(body),
      );
      log("response.body = ${response.body}");
      if (response.statusCode == 200) {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);

        return ApiResponse.fromJsonString(json: data);
      } else if (response.statusCode == 400) {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);

        print(data);

        return ApiResponse.fromJsonError(json: data);
      } else {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);

        ApiResponse apiResponse = ApiResponse.fromJsonError(json: data);
        throw ServerException(
          status: apiResponse.status,
          showMessageToUser: apiResponse.showMessageToUser,
          message: apiResponse.message,
          statusCode: apiResponse.statusCode,
        );
      }
    } catch (error) {
      print(error.toString());
      throw ServerException(
        status: false,
        showMessageToUser: false,
        message: error.toString(),
      );
    }
  }

  static Future<ApiResponse<T>> postDataList<T>({
    required String endpoint,
    Map<String, dynamic>? body,
    bool isStringList = false,
    required T Function(dynamic data) fromJsonT,
  }) async {
    print('${AppConstants.API_URL}$endpoint');
    print("body = ${jsonEncode(body)}");
    try {
      final response = await http.post(
        Uri.parse('${AppConstants.API_URL}$endpoint'),
        headers: {
          'Content-Type': 'application/json',
          "Accept-Language": await LocaleCubit.getLangSharedPrefForApi(),
          "Authorization":
          "Bearer ${await SecureStorageHelper().getPrefString(key: AppConstants.ACCESS_TOKEN, defaultValue: "")}",
        },
        body: body != null ? jsonEncode(body) : null,
      );
      if (response.statusCode == 200) {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);

        return ApiResponse.fromJsonDataList(
          json: data,
          fromJsonT: fromJsonT,
          isStringList: isStringList,
        );
      } else if (response.statusCode == 400) {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);

        print(data);

        return ApiResponse.fromJsonError(json: data);
      } else {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);

        ApiResponse apiResponse = ApiResponse.fromJsonError(json: data);
        throw ServerException(
          status: apiResponse.status,
          showMessageToUser: apiResponse.showMessageToUser,
          message: apiResponse.message,
          statusCode: apiResponse.statusCode,
        );
      }
    } catch (error) {
      print(error.toString());
      throw ServerException(
        status: false,
        showMessageToUser: false,
        message: error.toString(),
      );
    }
  }
}
