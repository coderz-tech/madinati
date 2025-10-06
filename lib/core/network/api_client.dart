import 'dart:convert';
import 'dart:developer';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:http/http.dart' as http;
import '../constants/api_constants.dart';
import '../constants/app_constants.dart';
import '../errors/server_exceptions.dart';
import '../locale/presentation/cubit/locale_cubit.dart';
import '../utils/io.dart';
import '../utils/secure_storage_helper.dart';
import 'api_response.dart';

class ApiClient {
  static Future<String> getImage<T>({
    required String endpoint,
    T Function(dynamic data)? fromJsonT,
  }) async {
    log('$endpoint');
    try {
      final response = await http.get(
        Uri.parse('$endpoint'),
        headers: {
          "Authorization":
              "Bearer ${await SecureStorageHelper().getPrefString(key: AppConstants.ACCESS_TOKEN, defaultValue: "")}",
          "Accept-Language": await LocaleCubit.getLangSharedPrefForApi(),
        },
      );
      IO.printBlue("status code :: ${response.statusCode} , body :: ${response.body} , headers :: ${response.headers} , request :: ${response.request} , bodyBytes :: ${response.bodyBytes}");
      if (response.statusCode == 200) {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        IO.printWarning(decodedResponse);
        final data = json.decode(decodedResponse);
        log(data.toString());
        return jsonEncode(data);
      } else if (response.statusCode == 400) {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);

        log(data.toString());

        return jsonEncode(data);
      } else {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);
        log(data.toString());
        ApiResponse apiResponse = ApiResponse.fromJsonError(json: data);
        // log(apiResponse.statusCode.toString());
        throw ServerException(
          // status: apiResponse.status,
          showMessageToUser: apiResponse.showMessageToUser,
          // message: apiResponse.message,
          // statusCode: apiResponse.statusCode,
        );
      }
    } catch (error) {
      log(error.toString());

      throw ServerException(
        status: false,
        showMessageToUser: false,
        message: error.toString(),
      );
    }
  }

  static Future<ApiResponse<T>> getData<T>({
    required String endpoint,
    T Function(dynamic data)? fromJsonT,
  }) async {
    log('${ApiConstants.baseUrl}$endpoint');
    try {
      final response = await http.get(
        Uri.parse('${ApiConstants.baseUrl}$endpoint'),
        headers: {
          "Authorization":
              "Bearer ${await SecureStorageHelper().getPrefString(key: AppConstants.ACCESS_TOKEN, defaultValue: "")}",
          "Accept-Language": await LocaleCubit.getLangSharedPrefForApi(),
        },
      );
      IO.printBlue("status code :: ${response.statusCode} , body :: ${response.body}");
      if (response.statusCode == 200) {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        IO.printWarning(decodedResponse);
        final data = json.decode(decodedResponse);
        log(data.toString());
        return ApiResponse.fromJsonData(json: data, fromJsonT: fromJsonT);
      } else if (response.statusCode == 400) {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);

        log(data.toString());

        return ApiResponse.fromJsonError(json: data);
      } else {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);
        log(data.toString());
        ApiResponse apiResponse = ApiResponse.fromJsonError(json: data);
        // log(apiResponse.statusCode.toString());
        throw ServerException(
          // status: apiResponse.status,
          showMessageToUser: apiResponse.showMessageToUser,
          // message: apiResponse.message,
          // statusCode: apiResponse.statusCode,
        );
      }
    } catch (error) {
      log(error.toString());
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
    log('${ApiConstants.baseUrl}$endpoint');
    try {
      final response = await http.get(
        Uri.parse('${ApiConstants.baseUrl}$endpoint'),
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

        log(data.toString());

        return ApiResponse.fromJsonError(json: data);
      } else {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);

        ApiResponse apiResponse = ApiResponse.fromJsonError(json: data);
        throw ServerException(
          // status: apiResponse.status,
          showMessageToUser: apiResponse.showMessageToUser,
          // message: apiResponse.message,
          // statusCode: apiResponse.statusCode,
        );
      }
    } catch (error) {
      log(error.toString());
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
      log('${ApiConstants.baseUrl}$endpoint');
      log("body = ${jsonEncode(body)}");
      final response = await http.post(
        Uri.parse('${ApiConstants.baseUrl}$endpoint'),
        headers: {
          "Accept-Language": await LocaleCubit.getLangSharedPrefForApi(),
          'Content-Type': 'application/json',
          "Authorization":
              "Bearer ${await SecureStorageHelper().getPrefString(key: AppConstants.ACCESS_TOKEN, defaultValue: "")}",
        },
        body: body != null ? jsonEncode(body) : null,
      );
      log(response.body);
      if (response.statusCode == 200) {
        final String decodedResponse = utf8.decode(response.bodyBytes);

        var data = json.decode(decodedResponse);
        log(data.toString());
        return ApiResponse.fromJsonData(json: data, fromJsonT: fromJsonT);
      } else if (response.statusCode == 400) {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);

        log(data);

        return ApiResponse.fromJsonError(json: data);
      } else {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);
        ApiResponse apiResponse = ApiResponse.fromJsonError(json: data);
        // log(apiResponse.statusCode);
        throw ServerException(
          // status: apiResponse.status,
          showMessageToUser: apiResponse.showMessageToUser,
          // message: apiResponse.message,
          // statusCode: apiResponse.statusCode,
        );
      }
    } catch (error) {
      log(error.toString());
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
    log('${ApiConstants.baseUrl}$endpoint');
    log("body = ${jsonEncode(fields)}");
    try {
      var request = http.MultipartRequest(
        "POST",
        Uri.parse("${ApiConstants.baseUrl}$endpoint"),
      );
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

      log("response.body = ${response.body} ");
      log("response.body = ${response.statusCode} ");

      if (response.statusCode == 200) {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);
        return ApiResponse.fromJsonData(json: data, fromJsonT: fromJsonT);
      } else if (response.statusCode == 400) {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);

        log(data.toString());
        return ApiResponse.fromJsonError(json: data);
      } else {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);

        ApiResponse apiResponse = ApiResponse.fromJsonError(json: data);
        throw ServerException(
          // status: apiResponse.status,
          showMessageToUser: apiResponse.showMessageToUser,
          // message: apiResponse.message,
          // statusCode: apiResponse.statusCode,
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
    log('${ApiConstants.baseUrl}$endpoint');
    log("body = ${jsonEncode(body)}");
    DateTime now = DateTime.now();
    DateTime oneMonthLater = DateTime(
      now.year,
      now.month + 1,
      now.day,
      now.hour,
      now.minute,
      now.second,
    );
    int timestampOneMonthLater = oneMonthLater.millisecondsSinceEpoch ~/ 1000;

    final jwt = JWT({
      "Scope": ["WasteManagement.API"],
      "Language": await LocaleCubit.getLangSharedPrefForApi(),
      "exp": timestampOneMonthLater,
      "iss": AppConstants.issuer,
      "aud": AppConstants.issuer,
    }, issuer: AppConstants.issuer);

    final token = jwt.sign(SecretKey(AppConstants.issuer));
    log("token = $token");

    try {
      final response = await http.post(
        Uri.parse('${ApiConstants.baseUrl}$endpoint'),
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);

        return ApiResponse.fromJsonString(json: data);
      } else if (response.statusCode == 400) {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);

        log(data.toString());

        return ApiResponse.fromJsonError(json: data);
      } else {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);

        ApiResponse apiResponse = ApiResponse.fromJsonError(json: data);
        throw ServerException(
          // status: apiResponse.status,
          showMessageToUser: apiResponse.showMessageToUser,
          // message: apiResponse.message,
          // statusCode: apiResponse.statusCode,
        );
      }
    } catch (error) {
      log(error.toString());
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
    log('${ApiConstants.baseUrl}$endpoint');
    log("body = ${jsonEncode(body)}");
    try {
      final response = await http.post(
        Uri.parse('${ApiConstants.baseUrl}$endpoint'),
        headers: {
          'Content-Type': 'application/json',
          "Accept-Language": await LocaleCubit.getLangSharedPrefForApi(),
          "Authorization":
              "Bearer ${await SecureStorageHelper().getPrefString(key: AppConstants.ACCESS_TOKEN, defaultValue: "")}",
        },
        body: body != null ? jsonEncode(body) : null,
      );
      IO.printBlue("status code :: ${response.statusCode}");
      IO.printBlue("response body :: ${response.body}");
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

        log(data.toString());

        return ApiResponse.fromJsonError(json: data);
      } else {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);

        ApiResponse apiResponse = ApiResponse.fromJsonError(json: data);
        throw ServerException(
          // status: apiResponse.status,
          showMessageToUser: apiResponse.showMessageToUser,
          // message: apiResponse.message,
          // statusCode: apiResponse.statusCode,
        );
      }
    } catch (error) {
      log(error.toString());
      throw ServerException(
        status: false,
        showMessageToUser: false,
        message: error.toString(),
      );
    }
  }
}
