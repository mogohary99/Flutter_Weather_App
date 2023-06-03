import 'package:dio/dio.dart';
import 'package:flutter_weather_app/core/utils/constants/strings_manager.dart';
import 'package:flutter_weather_app/data/commen/request_interceptor.dart';


class NetworkModule {
  final Dio _dio = Dio();
  final String _baseUrl = AppStrings.baseUrl;
  //final RequestInterceptor requestInterceptor;

  NetworkModule();

  BaseOptions _dioOptions(){
    BaseOptions opts = BaseOptions();
    opts.baseUrl = _baseUrl;
    opts.connectTimeout = const Duration(milliseconds: 6000);
    opts.receiveTimeout = const Duration(milliseconds: 6000);
    opts.sendTimeout = const Duration(milliseconds: 6000);
    return opts;
  }

  Dio provideDio(){
    _dio.options = _dioOptions();
   // _dio.interceptors.add(requestInterceptor);
    return _dio;
  }
}
