import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:placealouer/utils/network/request_class.dart';

class NetworkDio {
  static Dio dio = Dio();

  static setHeaders(Map<String, dynamic> headers) {
    dio.options.headers = {"Content-Type": "application/json", ...headers};
  }

  static getHeaders() {
    log("--->> ${dio.options.headers}");
    return dio.options.headers;
  }

  static Future<Response> request({
    required Request request,
  }) async {
    try {
      log(' request ${request.body?.data}');
      log(' request URL ${request.url}');
      switch (request.method) {
        case Method.get:
          return await dio.get(request.url!,
              queryParameters: request.body?.data,
              options: Options(headers: request.headers ?? getHeaders()));
        case Method.post:
          return await dio.post(request.url!,
              data: request.body?.data,
              options: Options(headers: request.headers));
        case Method.put:
          return await dio.put(request.url!,
              data: request.body?.data,
              options: Options(headers: request.headers));
        case Method.patch:
          return await dio.patch(request.url!,
              data: request.body?.data,
              options: Options(headers: request.headers));
        case Method.delete:
          return await dio.delete(request.url!,
              data: request.body?.data,
              options: Options(headers: request.headers));
        default:
          throw Exception("Invalid Method");
      }
    } on DioException catch (e, st) {
      log('\x1B[31m error ${e.requestOptions.data}');
      log('\x1B[31m error ${e.requestOptions.headers}');
      log('\x1B[31m error- ST ${st}');
      return e.response!;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response> multiPartRequest<T>({
    required MultiPartRequest request,
  }) async {
    try {
      switch (request.method) {
        case Method.post:
          return await dio.post(request.url!,
              data: request.formData,
              options: Options(headers: request.headers));

        case Method.patch:
          return await dio.patch(request.url!,
              data: request.formData,
              options: Options(headers: request.headers));

        case Method.put:
          return await dio.put(request.url!,
              data: request.formData,
              options: Options(headers: request.headers));
        default:
          throw Exception("Invalid Method");
      }
    } on DioException catch (e) {
      return e.response!;
    } catch (e) {
      rethrow;
    }
  }
}
