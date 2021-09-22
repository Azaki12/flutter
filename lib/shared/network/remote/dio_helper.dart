import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

// https://student.valuxapps.com/api/ > shop app
// https://newsapi.org/ > news app

class DioHelper {
  static Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    @required String url,
    Map<String, dynamic> query,
    String lang = 'ar',
    String token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': '$lang',
      'Authorization': token,
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    @required String url,
    @required Map<String, dynamic> data,
    Map<String, dynamic> query,
    String lang = 'ar',
    String token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': '$lang',
      'Authorization': token,
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    @required String url,
    @required Map<String, dynamic> data,
    Map<String, dynamic> query,
    String lang = 'ar',
    String token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': '$lang',
      'Authorization': token,
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
