
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kabarpagi/core/config/config.dart';
import 'package:kabarpagi/core/data/api.dart';
import 'package:kabarpagi/core/data/base_api_impl.dart';
import 'package:kabarpagi/core/models/api/api_response.dart';
import 'package:kabarpagi/injector.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


class BaseAPI implements BaseAPIImpl {
  Dio? _dio;
  final endpoint = locator<Api>();

  /// Initialize constructors
  BaseAPI() {
    _dio = Dio();
    /// Only show logging in debug mode
    if (kDebugMode) {
      _dio?.interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true
      ));
    }
  }
  Future<Options> _getHeaders({bool? useToken, bool? useFormData = false}) async {
    var header = <String, dynamic>{};
    header['Accept'] = 'application/json';
    header['User-Agent'] = 'KabarPagi';
    header['Content-Type'] = useFormData == true ? 'multipart/form-data' : 'application/json';
    if (useToken == true) {
      header['Authorization'] = '';
    }
    return Options(
      headers: header,
      sendTimeout: 60*1000, // 60 seconds
      receiveTimeout: 60*1000 // 60 seconds
    );
  }

  @override
  Future<APIResponse> delete(String url, {Map<String, dynamic>? param, bool? useToken}) async {
    try {
      final result = await _dio?.delete(
        url,
        options: await _getHeaders(useToken: useToken),
        queryParameters: param
      );
      return _parseResponse(result);
    } on DioError catch(e) {
      validateUnauthorized(e.response?.statusCode, url);
      return APIResponse.failure(e.response?.data['message'] ?? e.response?.data['error'] ?? e.message, e.response?.statusCode ?? 0);
    }
  }

  @override
  Future<APIResponse> get(String url, {Map<String, dynamic>? param, bool? useToken, CancelToken? cancelToken}) async {
    /// Inserting api key on every request
    Map<String, dynamic> params = {"apiKey": apiKey};
    params.addAll(param ?? {});

    try {
      final result = await _dio?.get(
        url,
        options: await _getHeaders(useToken: useToken),
        queryParameters: params,
        cancelToken: cancelToken
      );
      return _parseResponse(result);
    } on DioError catch(e) {
      validateUnauthorized(e.response?.statusCode, url);
      return APIResponse.failure(e.response?.data['message'] ?? e.response?.data['error'] ?? e.message, e.response?.statusCode ?? 0);
    }
  }

  @override
  Future<APIResponse> post(String url, {Map<String, dynamic>? param, data, bool? useToken, bool useFormData = true}) async {
    try {
      final result = await _dio?.post(
        url,
        options: await _getHeaders(useToken: useToken, useFormData: useFormData),
        data: data != null ? (useFormData ? FormData.fromMap(data) : data) : null,
        queryParameters: param
      );
      return _parseResponse(result);
    } on DioError catch(e) {
      validateUnauthorized(e.response?.statusCode, url);
      return APIResponse.failure(e.response?.data['message'] ?? e.response?.data['error'] ?? e.message, e.response?.statusCode ?? 0);
    }
  }

  @override
  Future<APIResponse> put(String url, {Map<String, dynamic>? param, data, bool? useToken}) async {
    try {
      final result = await _dio?.put(
        url,
        options: await _getHeaders(useToken: useToken),
        data: data,
        queryParameters: param
      );
      return _parseResponse(result);
    } on DioError catch(e) {
      validateUnauthorized(e.response?.statusCode, url);
      return APIResponse.failure(e.response?.data['message'] ?? e.response?.data['error'] ?? e.message, e.response?.statusCode ?? 0);
    }
  }

  void validateUnauthorized(int? statusCode, String url) async {
    if (statusCode == 401){
      /// navigate to login page
    }
  }
  
  Future<APIResponse> _parseResponse(Response? response) async {
    return APIResponse.fromJson(
      {
        'status': response?.data['status'],
        'data': response?.data,
        'message': response?.data['message'] ?? (response?.data['error'] ?? response?.statusMessage),
      },
      response?.statusCode ?? 0
    );
  }
}