import 'dart:developer';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:placealouer/app.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/model/login_model.dart';
import 'package:placealouer/utils/network/network.dart';
import 'package:placealouer/utils/network/request_class.dart';
import 'package:placealouer/utils/network/response_class.dart';

class ApiRepo {
  static String baseUrl = "http://34.203.226.208:8001/";

  // Returns the base URL used for API calls.
  static String getBaseUrl() {
    return baseUrl;
  }

  /// Returns the API URL by concatenating the base URL with the given [url].
  ///
  /// The [url] parameter is the specific endpoint URL for the API call.
  ///
  /// Returns a [String] representing the complete API URL.
  static String getApiUrl(String url) {
    return baseUrl + url;
  }

  /// Returns the API URL with the provided [url] and [id].
  ///
  /// The [url] parameter is the endpoint URL, and the [id] parameter is the ID for the API call.
  ///
  /// Returns a [String] representing the complete API URL with the concatenated [url] and [id].
  static String getApiUrlWithId(String url, String id) {
    return "$baseUrl$url/$id";
  }

  /// Logs in the user and returns a [ResponseData] object containing the response data.
  ///
  /// This function sends a POST request to the login endpoint of the API with the provided credentials.
  /// It expects the response to have a JSON body that can be parsed into the specified generic type [T].
  ///
  /// Returns a [ResponseData] object containing the response code, data, status, and message.
  ///
  /// Throws any exception that occurs during the request or response validation process.
  static Future<ResponseData<T>> login<T>(
      Map<String, dynamic> credentials) async {
    try {
      final res = await NetworkDio.request(
        request: Request(
          method: Method.post,
          url: getApiUrl('user/login'),
          body: RequestBody(data: credentials),
        ),
      );

      log("------------>> Res ${res.statusCode}");

      /// wrap [validateResponse] with toJson methos of model
      final data = LoginModel.fromMap(await validateResponse(res));

      final response = ResponseData<T>(
          code: res.statusCode,
          data: data as T,
          status: res.statusMessage,
          message: 'Success');
      log("====---->> ${response.code}");
      if (res.statusCode == 200 || res.statusCode == 201) {
        globalScaffoldKey.currentState?.showSnackBar(successfulSnackBar(res));
      }
      return response;
    } catch (e, st) {
      log("----=-=-=--> $e");
      log("----=-=-=--> $st");
      rethrow;
    }
  }

  static Future<ResponseData<T>> signup<T>(
      Map<String, dynamic> credentials) async {
    try {
      final res = await NetworkDio.request(
        request: Request(
          method: Method.post,
          url: getApiUrl('user/signup'),
          body: RequestBody(data: credentials),
        ),
      );

      log("------------>> Res ${res.statusCode}");

      /// wrap [validateResponse] with toJson methos of model
      final data = await validateResponse(res);

      final response = ResponseData<T>(
          code: res.statusCode,
          data: data as T,
          status: res.statusMessage,
          message: 'Success');
      log("====---->> ${response.code}");
      if (res.statusCode == 200) {
        globalScaffoldKey.currentState?.showSnackBar(successfulSnackBar(res));
      }
      return response;
    } catch (e, st) {
      log("----=-=-=--> $e");
      log("----=-=-=--> $st");
      rethrow;
    }
  }

  static Future<ResponseData<T>> forgoetPassword<T>(
      Map<String, dynamic> credentials) async {
    try {
      final res = await NetworkDio.request(
        request: Request(
          method: Method.post,
          url: getApiUrl('user/forgorPassword'),
          // headers: NetworkDio.getHeaders(),
          body: RequestBody(data: credentials),
        ),
      );

      /// wrap [validateResponse] with toJson methos of model
      final data = await validateResponse(res);

      final response = ResponseData<T>(
          code: res.statusCode,
          data: data as T,
          status: res.statusMessage,
          message: 'Success');
      if (res.statusCode == 200 || res.statusCode == 201) {
        globalScaffoldKey.currentState?.showSnackBar(successfulSnackBar(res));
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<ResponseData<T>> signupVerification<T>(
      Map<String, dynamic> otpVerificationData) async {
    try {
      final res = await NetworkDio.request(
        request: Request(
          method: Method.post,
          url: getApiUrl('user/signup_verification'),
          // headers: NetworkDio.getHeaders(),
          body: RequestBody(data: otpVerificationData),
        ),
      );

      /// wrap [validateResponse] with toJson methos of model
      final data = await validateResponse(res);

      final response = ResponseData<T>(
          code: res.statusCode,
          data: data as T,
          status: res.statusMessage,
          message: 'Success');
      if (res.statusCode == 200 || res.statusCode == 201) {
        globalScaffoldKey.currentState?.showSnackBar(successfulSnackBar(res));
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<ResponseData<T>> resetPassword<T>(
      Map<String, dynamic> resetPasswordData) async {
    try {
      final res = await NetworkDio.request(
        request: Request(
          method: Method.post,
          url: getApiUrl('user/reset_password'),
          // headers: NetworkDio.getHeaders(),
          body: RequestBody(data: resetPasswordData),
        ),
      );

      /// wrap [validateResponse] with toJson methos of model
      final data = await validateResponse(res);

      final response = ResponseData<T>(
          code: res.statusCode,
          data: data as T,
          status: res.statusMessage,
          message: 'Success');
      if (res.statusCode == 200 || res.statusCode == 201) {
        globalScaffoldKey.currentState?.showSnackBar(successfulSnackBar(res));
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<ResponseData<T>> otpVerification<T>(
      Map<String, dynamic> otpVerificationData) async {
    try {
      final res = await NetworkDio.request(
        request: Request(
          method: Method.post,
          url: getApiUrl('user/otp_verification'),
          // headers: NetworkDio.getHeaders(),
          body: RequestBody(data: otpVerificationData),
        ),
      );

      /// wrap [validateResponse] with toJson methos of model
      final data = await validateResponse(res);

      final response = ResponseData<T>(
          code: res.statusCode,
          data: data as T,
          status: res.statusMessage,
          message: 'Success');
      if (res.statusCode == 200 || res.statusCode == 201) {
        globalScaffoldKey.currentState?.showSnackBar(successfulSnackBar(res));
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// Uploads a profile picture.
  ///
  /// This function creates a `FormData` object and adds multiple files to it.
  /// The files are added using the `MultipartFile.fromFile` method.
  /// The `FormData` object is then used in a multi-part request to the 'auth/profile-pic' endpoint.
  ///
  /// Returns a `Future` that completes with the response data from the request.
  static Future<ResponseData<T>> uploadImage<T>(
      Uint8List value, String filename) async {
    var formData = FormData();
    try {
      formData.files.add(MapEntry(
          'image', MultipartFile.fromBytes(value, filename: filename)));
      var res = await NetworkDio.multiPartRequest(
          request: MultiPartRequest(
        url: getApiUrl('upload/media/image'),
        method: Method.post,
        headers: {
          ...NetworkDio.getHeaders(),
          ...{'Content-Type': 'multipart/form-data'}
        },
        formData: formData,
      ));
      final data = await validateResponse(res);

      final response = ResponseData<T>(
          code: res.statusCode,
          data: data as T,
          status: res.statusMessage,
          message: 'Success');

      return response;
    } catch (e) {
      rethrow;
    }
  }
}

/// Validates the response received from the API.
///
/// Takes a [Response] object as input and checks the status code of the response.
/// If the status code is 200, it returns the response data.
/// If the status code is 400, it returns the response data.
/// If the status code is 401, it returns the response data.
/// If the status code is 404, it returns the response data.
/// If the status code is 500, it returns the response data.
/// If the status code is none of the above, it returns the response data.
///
///
/// Returns the response data.
Future validateResponse(Response response) async {
  log("---->>>validateResponse ${response.statusCode == 404} ");
  if (response.statusCode == 200) {
    log("--------------- 200");

    return response.data;
  } else if (response.statusCode == 400) {
    log("--------------- 400");

    globalScaffoldKey.currentState?.showSnackBar(errorSnackBar(response));
    return response.data;
  } else if (response.statusCode == 401) {
    log("--------------- 401 ");

    globalScaffoldKey.currentState?.showSnackBar(errorSnackBar(response));

    return response.data;
  } else if (response.statusCode == 403) {
    log("--------------- 403 ${response.data["message"]}");
    globalScaffoldKey.currentState?.showSnackBar(errorSnackBar(response));

    return response.data;
  } else if (response.statusCode == 404) {
    log("--------------- 404 ${response.data["message"]}");
    globalScaffoldKey.currentState?.showSnackBar(errorSnackBar(response));

    return response.data;
  } else if (response.statusCode == 500) {
    log("--------------- 500");

    globalScaffoldKey.currentState?.showSnackBar(errorSnackBar(response));

    return response.data;
  } else {
    return response.data;
  }
}

SnackBar errorSnackBar(Response<dynamic> response) {
  return SnackBar(
    content: Text(
      response.data['message'],
      style:
          AppTextStyle.normalRegularBold15.copyWith(color: redContainerColor),
    ),
    margin: const EdgeInsets.all(15),
    behavior: SnackBarBehavior.floating,
    backgroundColor: appWhiteColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(150)),
  );
}

SnackBar successfulSnackBar(Response<dynamic> response) {
  log("=---------------->> ${response.data["message"]}");
  return SnackBar(
    content: Text(
      response.data["message"],
      style: AppTextStyle.normalRegularBold15.copyWith(color: appBlackColor),
    ),
    margin: const EdgeInsets.all(15),
    behavior: SnackBarBehavior.floating,
    backgroundColor: appWhiteColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(150)),
  );
}
