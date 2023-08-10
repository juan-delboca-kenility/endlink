import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class CustomDioInterceptor extends Interceptor {
  bool get _log => false;
  bool get _logLogs => false;

  String get _tag => "HttpInterceptor";

  CustomDioInterceptor();

  bool _shouldPrint(RequestOptions options) {
    if (!_log) return false;
    final isLog = options.uri.toString().contains("event-logs-api");
    if (isLog && !_logLogs) return false;
    return true;
  }

  _printRequestOptions(RequestOptions options) {
    if (!_shouldPrint(options)) return;
    log("URI: ${options.uri}", name: _tag);
    log("Method: ${options.method}", name: _tag);
    log("Data: ${options.data?.toString()}", name: _tag);
    log("Headers: ${options.headers.toString()}", name: _tag);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);

    if (_shouldPrint(options)) {
      log("New request:", name: _tag);
      _printRequestOptions(options);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    if (_shouldPrint(err.requestOptions)) {
      log("Request error:", error: err, stackTrace: err.stackTrace, name: _tag);
      _printRequestOptions(err.requestOptions);
      log("Message: ${err.message}", name: _tag);
      log("Response: ${err.response}", name: _tag);
      log("Type: ${err.type}", name: _tag);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);

    if (_shouldPrint(response.requestOptions)) {
      log("Request response:", name: _tag);
      log("URI: ${response.realUri}", name: _tag);
      log("Status code: ${response.statusCode}", name: _tag);
      log("Status message: ${response.statusMessage}", name: _tag);
      log("Data: ${response.data}", name: _tag);
      log("Headers: ${response.headers}", name: _tag);
    }
  }
}
