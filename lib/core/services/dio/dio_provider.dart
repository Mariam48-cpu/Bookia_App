import 'package:bookia_app/core/services/dio/apis.dart';
import 'package:dio/dio.dart';

class DioProvider {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: Apis.baseUrl,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      ),
    );
  }

  static Future<Response> postApi({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
  }) async {
    return dio.post(
      endPoint,
      data: data,
      options: Options(headers: headers),
      queryParameters: params,
    );
  }

  static Future<Response> getApi({
    required String endPoint,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
  }) async {
    return dio.get(
      endPoint,
      options: Options(headers: headers),
      queryParameters: params,
    );
  }

  static Future<Response> putApi({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
  }) async {
    return dio.put(
      endPoint,
      data: data,
      options: Options(headers: headers),
      queryParameters: params,
    );
  }

  static Future<Response> deleteApi({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
  }) async {
    return dio.delete(
      endPoint,
      data: data,
      options: Options(headers: headers),
      queryParameters: params,
    );
  }

  static Future<Response> patchApi({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
  }) async {
    return dio.patch(
      endPoint,
      data: data,
      options: Options(headers: headers),
      queryParameters: params,
    );
  }
}
