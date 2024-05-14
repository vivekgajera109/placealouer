// ignore_for_file: prefer_typing_uninitialized_variables, use_build_context_synchronously, deprecated_member_use

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../internet_error.dart';
import '../process_indicator.dart';
// import '../repository/network_repository.dart';

class NetworkDioHttp {
  static Dio _dio = Dio();
  static String? endPointUrl;
  static Options? _cacheOptions;
  // static DioCacheManager? _dioCacheManager;
  static Circle processIndicator = Circle();

  NetworkCheck networkCheck = NetworkCheck();
  static InternetError internetError = InternetError();
  static final dataStorage = GetStorage();

  static Future<Map<String, String>> getHeaders() async {
    // final String? token = dataStorage.read(.userToken);

    if ("token" != "") {
      debugPrint('~~~~~~~~~~~~~~~~~~~~ SET HEADER :  ~~~~~~~~~~~~~~~~~~~');
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'authorization': "token",
      };
    } else {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
    }
  }

  static setDynamicHeader({@required String? endPoint}) async {
    endPointUrl = endPoint;
    BaseOptions options = BaseOptions(
      receiveTimeout: const Duration(milliseconds: 50000),
      connectTimeout: const Duration(milliseconds: 50000),
    );
    // _dioCacheManager = DioCacheManager(CacheConfig());
    final token = await getHeaders();
    options.headers.addAll(token);
    _dio = Dio(options);
  }

  //Get Method
  Future<Map<String, dynamic>> getDioHttpMethod({
    BuildContext? context,
    final queryParams,
    required String url,
    final header,
  }) async {
    var internet = await check();
    if (internet) {
      if (context != null) processIndicator.show(context);
      try {
        debugPrint(url);
        // ignore: unnecessary_string_interpolations
        Response response = await _dio.get(
          url,
          options: header ?? _cacheOptions,
          queryParameters: queryParams ?? {},
        );

        var responseBody;
        if (response.statusCode == 200) {
          if (context != null) processIndicator.hide(context);
          try {
            responseBody = json.decode(response.data);
          } catch (error) {
            responseBody = response.data;
          }
          Map<String, dynamic> data = {
            'statusCode': response.statusCode,
            'body': responseBody,
            'headers': response.headers,
            'error_description': null,
          };

          return data;
        } else {
          if (context != null) processIndicator.hide(context);
          return {
            'statusCode': response.statusCode,
            'body': null,
            'headers': null,
            'error_description': "Something Went Wrong",
          };
        }
      } on DioError catch (e) {
        Map<String, dynamic> responseData = {
          'statusCode': e.response?.statusCode,
          'body': null,
          'headers': null,
          'error_description': await handleError(e, context,
              message: e.response?.data['error'].isEmpty
                  ? e.response?.data['message']
                  : e.response?.data['error']),
        };
        if (context != null) processIndicator.hide(context);
        return responseData;
      }
    } else {
      Map<String, dynamic> responseData = {
        'statusCode': 404,
        'body': null,
        'headers': null,
        'error_description': "Internet Error",
      };
      if (context != null) processIndicator.hide(context);

      // internetError.addOverlayEntry(context);
      return responseData;
      // func(false);
    }
  }

  //Put Method

  Future<Map<String, dynamic>> putDioHttpMethod({
    BuildContext? context,
    required String url,
    required data,
    final header,
  }) async {
    var internet = await check();
    if (internet) {
      if (context != null) processIndicator.show(context);
      try {
        log("URL: $url");
        Response response =
            await _dio.put(url, data: data, options: header ?? _cacheOptions);

        var responseBody;
        if (response.statusCode == 200) {
          if (context != null) processIndicator.hide(context);
          try {
            responseBody = json.decode(json.encode(response.data));
          } catch (e) {
            responseBody = response.data;
            debugPrint('catch...');
          }

          return {
            'statusCode': response.statusCode,
            'body': responseBody,
            'headers': response.headers,
            'error_description': null,
          };
        } else {
          if (context != null) processIndicator.hide(context);
          if (response.data != null && response.data['error'] != null) {
            return {
              'statusCode': response.statusCode,
              'body': null,
              'headers': null,
              'error_description': response.data['error'],
            };
          }
          return {
            'statusCode': response.statusCode,
            'body': null,
            'headers': null,
            'error_description': "Something Went Wrong",
          };
        }
      } on DioError catch (e) {
        // log("message error ==> ${e.response?.data}");
        Map<String, dynamic> responseData = {
          'statusCode': e.response?.statusCode,
          'body': e.response?.data,
          'headers': null,
          'error_description':
              await handleError(e, context, message: e.response?.data['error']),
          // 'error_description': await _handleError(e, context, message: e.response?.data['message']),
        };
        if (context != null) processIndicator.hide(context);
        return responseData;
      }
    } else {
      Map<String, dynamic> responseData = {
        'statusCode': 404,
        'body': null,
        'headers': null,
        'error_description': "Internet Error",
      };
      internetError.addOverlayEntry(context);
      return responseData;
      // func(false);
    }
  }

  static Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  //Post Method
  static Future<Map<String, dynamic>> postDioHttpMethod({
    BuildContext? context,
    required String url,
    required data,
    final header,
  }) async {
    // Function to track upload progress

    if (context != null) processIndicator.show(context);
    try {
      debugPrint("URL :$url");

      Response response = await _dio.post(
        url,
        data: data,
        options: header ?? _cacheOptions,
      );

      // log(' response ==>${response.toString()}');

      if (context != null) processIndicator.hide(context);
      var responseBody;

      if (response.statusCode == 200) {
        try {
          responseBody = json.decode(json.encode(response.data));
        } catch (error) {
          debugPrint('decode error');
          responseBody = response.data;
        }
        return {
          'statusCode': response.statusCode,
          'body': responseBody..addAll({'statusCode': response.statusCode}),
          'headers': response.headers,
          'error_description': null,
        };
      } else {
        if (context != null) processIndicator.hide(context);
        return {
          'statusCode': response.statusCode,
          'body': null,
          'headers': null,
          'error_description': response.statusMessage,
        };
      }
    } on DioError catch (e) {
      log("message---->>> 1 ${await handleError(e, context, message: e.response?.data['message'])}");
      log("message---->>> 1 ${e.response?.statusCode}");
      if (context != null) processIndicator.hide(context);
      Map<String, dynamic> responseData = {
        'statusCode': e.response?.statusCode,
        'body': e.response?.data.addAll({'statusCode': e.response?.statusCode}),
        'headers': null,
        'error_description':
            await handleError(e, context, message: e.response?.data['message']),
      };
      return responseData;
    }
  }

  //Delete Method
  Future<Map<String, dynamic>> deleteDioHttpMethod(
      {BuildContext? context, required String url, data}) async {
    var internet = await check();
    if (internet) {
      if (context != null) processIndicator.show(context);
      try {
        debugPrint(data);
        debugPrint("URL :$url");
        Response response = await _dio.delete(
          url,
          data: data,
          options: _cacheOptions,
        );
        var responseBody;

        if (response.statusCode == 200) {
          if (context != null) processIndicator.hide(context);
          try {
            responseBody = json.decode(json.encode(response.data));
          } catch (error) {
            debugPrint('decode error');
            responseBody = response.data;
          }
          return {
            'statusCode': response.statusCode,
            'body': responseBody,
            'headers': response.headers,
            'error_description': null,
          };
        } else {
          if (context != null) processIndicator.hide(context);
          return {
            'statusCode': response.statusCode,
            'body': null,
            'headers': null,
            'error_description': "Something Went Wrong",
          };
        }
      } on DioError catch (e) {
        Map<String, dynamic> responseData = {
          'statusCode': e.response?.statusCode,
          'body': null,
          'headers': null,
          'error_description': await handleError(e, context,
              message: e.response?.data['message']),
        };
        if (context != null) processIndicator.hide(context);
        return responseData;
      }
    } else {
      Map<String, dynamic> responseData = {
        'statusCode': 404,
        'body': null,
        'headers': null,
        'error_description': "Internet Error",
      };
      internetError.addOverlayEntry(context);
      return responseData;
      // func(false);
    }
  }

  // //Multiple Concurrent
  static Future<Map<String, dynamic>> multipleConcurrentDioHttpMethod(
      {BuildContext? context,
      required String getUrl,
      required String postUrl,
      required Map<String, dynamic> postData}) async {
    try {
      if (context != null) processIndicator.show(context);
      List<Response> response = await Future.wait([
        _dio.post("$endPointUrl/$postUrl",
            data: postData, options: _cacheOptions),
        _dio.get("$endPointUrl/$getUrl", options: _cacheOptions)
      ]);
      if (response[0].statusCode == 200 || response[0].statusCode == 200) {
        if (response[0].statusCode == 200 && response[1].statusCode != 200) {
          if (context != null) processIndicator.hide(context);
          return {
            'getBody': null,
            'postBody': json.decode(response[0].data),
            'headers': response[0].headers,
            'error_description': null,
          };
        } else if (response[1].statusCode == 200 &&
            response[0].statusCode != 200) {
          if (context != null) processIndicator.hide(context);
          return {
            'getBody': null,
            'postBody': json.decode(response[0].data),
            'headers': response[0].headers,
            'error_description': null,
          };
        } else {
          if (context != null) processIndicator.hide(context);
          return {
            'postBody': json.decode(response[0].data),
            'getBody': json.decode(response[0].data),
            'headers': response[0].headers,
            'error_description': null,
          };
        }
      } else {
        if (context != null) processIndicator.hide(context);
        return {
          'postBody': null,
          'getBody': null,
          'headers': null,
          'error_description': "Something Went Wrong",
        };
      }
    } catch (e) {
      Map<String, dynamic> responseData = {
        'postBody': null,
        'getBody': null,
        'headers': null,
        'error_description': await handleError(e, context),
      };
      if (context != null) processIndicator.hide(context);
      return responseData;
    }
  }

  //Sending FormData
  static Future<Map<String, dynamic>> sendingFormDataDioHttpMethod(
      {required BuildContext? context,
      required String url,
      required Map<String, dynamic> data}) async {
    var internet = await check();
    if (internet) {
      try {
        if (context != null) processIndicator.show(context);
        FormData formData = FormData.fromMap(data);
        Response response = await _dio.post("$endPointUrl$url",
            data: formData, options: _cacheOptions);
        if (response.statusCode == 200) {
          if (context != null) processIndicator.hide(context);
          return {
            'statusCode': response.statusCode,
            'body': json.decode(response.data),
            'headers': response.headers,
            'error_description': null,
          };
        } else {
          if (context != null) processIndicator.hide(context);
          return {
            'statusCode': response.statusCode,
            'body': null,
            'headers': null,
            'error_description': "Something Went Wrong",
          };
        }
      } on DioError catch (e) {
        Map<String, dynamic> responseData = {
          'statusCode': e.response?.statusCode,
          'body': null,
          'headers': null,
          'error_description': await handleError(e, context),
        };
        if (context != null) processIndicator.hide(context);
        return responseData;
      }
    } else {
      Map<String, dynamic> responseData = {
        'statusCode': 404,
        'body': null,
        'headers': null,
        'error_description': "Internet Error",
      };
      internetError.addOverlayEntry(context);
      return responseData;
    }
  }

  // Handle Error
  static Future<String> handleError(error, context, {message}) async {
    String errorDescription = "";
    try {
      debugPrint("In side try");
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        debugPrint("In side internet condition");
        if (error is DioError) {
          // ignore: unnecessary_cast
          DioError dioError = error as DioError;

          log("message ===> type ==> ${dioError.type}");
          switch (dioError.type) {
            case DioErrorType.connectionTimeout:
              errorDescription = "Connection timeout with API server";
              debugPrint(errorDescription);
              break;
            case DioErrorType.sendTimeout:
              errorDescription = "Send timeout in connection with API server";
              debugPrint(errorDescription);
              break;
            case DioErrorType.receiveTimeout:
              errorDescription =
                  "Receive timeout in connection with API server";
              debugPrint(errorDescription);
              break;
            case DioErrorType.badResponse:
              errorDescription = message;
              debugPrint("hello response $errorDescription");
              break;
            case DioErrorType.cancel:
              errorDescription = "Request to API server was cancelled";
              debugPrint(errorDescription);
              break;
            case DioErrorType.unknown:
              errorDescription =
                  "Connection to API server failed due to internet connection";
              debugPrint(errorDescription);
              break;
            case DioErrorType.badCertificate:
              break;
            case DioErrorType.connectionError:
              break;
          }
        } else {
          errorDescription = "Unexpected error occured";
          debugPrint(errorDescription);
        }
      }
    } on SocketException catch (_) {
      errorDescription = "Please check your internet connection";
      debugPrint(errorDescription);
    }
    // if (errorDescription.contains("401") || errorDescription.contains("We can't find tokens in header!")) {
    // if (errorDescription.contains("401") || errorDescription.contains("no rows in result set")) {
    // if (errorDescription.contains("401") ||
    //     errorDescription.contains("token has expired")) {
    //   dataStorage.erase().then((value) async {
    //     print("User is Logging Out");
    //     // SessionDataStorage().clearAllData();
    //     // CommonMethod().getXSnackBar("Warning", 'Please do login first', blue);
    //     getas.Get.offAll(() => const Login());
    //   });
    // }
    if (errorDescription.contains("401") ||
        errorDescription.contains("Invalid token")) {
      dataStorage.erase().then((value) async {});
    }

    return errorDescription;
  }

  void showErrorDialog({required String message}) {
    // CommonMethod().getXSnackBar("Error", message.toString(), red);
  }

  Future checkResponseData(
    response,
    modelResponse,
  ) async {
    // log("response check------>2${response['body']['message']}---->Checked");
    if ((response['body']['status'] == 200 ||
        response['body']['status'] == "200")) {
      return modelResponse;
    } else {
      showErrorDialog(message: response['body']['message']);
      return response['body'];
    }
    // if ((response['body']['status'] == 401 ||
    //     response['body']['status'] == 410) &&
    //     dataStorage.read("token") != null) {}
    // if (response["error_description"] == null ||
    //     response["error_description"] == 'null') {
    //   if (response['body']['status'] == 200 ||
    //       response['body']['status'] == "200") {
    //     log('${response['body']}');
    //     return response['body'];
    //   } else if (response['body']['status'] == 500 ||
    //       response['body']['status'] == "500") {
    //     showErrorDialog(message: response['body']['message']);
    //     return response['body'];
    //   } else {
    //     showErrorDialog(message: response['body']['message']);
    //   }
    // } else {
    //   log("message in else ==>");
    //   if (dataStorage.read("token") != null) {
    //     showErrorDialog(message: response['error_description']);
    //   } else if (response['body']['status'] == 409 ||
    //       response['body']['status'] == "409") {
    //     showErrorDialog(message: response['body']['message']);
    //   }
    // }
  }
}

class NetworkCheck {
  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  dynamic checkInternet(bool func) {
    check().then((intenet) {
      if (intenet) {
        return true;
      } else {
        return false;
      }
    });
  }
}
