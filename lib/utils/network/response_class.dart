class ResponseData<T> {
  String? status;
  String? message;
  int? code;
  String? error;
  T? data;

  ResponseData({
    this.status,
    this.message,
    this.code,
    this.error,
    this.data,
  });
}
