import 'package:TryOn/core/utilits/functions/shared_pref.dart';
import 'package:dio/dio.dart';

class ApiService {
  static String baseUrl = 'https://upgrade-s.com/';

  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> get(
      {required String endPoint,
      Map<String, dynamic>? query,
      String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token ?? CacheHelper.getData('access_token'),
    };
    return await dio.get(endPoint, queryParameters: query);
  }

  static Future<Response> post(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic>? data,
      String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token ?? CacheHelper.getData('access_token'),
    };
    return await dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> put(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic>? data,
      String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token ?? CacheHelper.getData('access_token'),
    };
    return await dio.put(url, queryParameters: query, data: data);
  }

  static Future<Response> delete(
      {required String url, Map<String, dynamic>? query, String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token ?? CacheHelper.getData('access_token'),
    };
    return await dio.delete(url, queryParameters: query);
  }
}
