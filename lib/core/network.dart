import 'package:dio/dio.dart';
import 'package:flutter_test_call_api_pokedex/core/utils.dart';

class NetworkManager {
  final Dio dio;

  const NetworkManager._(this.dio);

  factory NetworkManager() {
    final dio = Dio();

    // dio.interceptors.add(DioCacheManager());

    return NetworkManager._(dio);
  }

  Future<Response<T>> request<T>(
    RequestMethod method,
    String url, {
    data,
    Map<String, dynamic>? queryParameter,
    Map<String, dynamic>? headers,
  }) {
    return dio.request(url,
        data: data,
        queryParameters: queryParameter,
        options: Options(method: method.value, headers: headers));
  }
}

enum RequestMethod { get, post, patch, update, delete }

extension RequestMethodX on RequestMethod {
  String get value => getEnumValue(this).toUpperCase();
}
