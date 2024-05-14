import 'package:dio/dio.dart';

class Request {
  String? url;
  Method method;
  Map<String, dynamic>? headers;
  RequestBody? body;

  Request({
    this.url,
    this.method = Method.get,
    this.headers,
    this.body,
  });
}

class RequestBody {
  Map<String, dynamic>? data;

  RequestBody({this.data});
}

enum Method { get, post, put, patch, delete }

class MultiPartRequest {
  String? url;
  Method method;
  Map<String, dynamic>? headers;

  FormData? formData; // for multipart request

  MultiPartRequest(
      {this.url, this.method = Method.get, this.headers, this.formData});
}
