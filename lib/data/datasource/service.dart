import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_weather_app/core/utils/constants/strings_manager.dart';
import 'package:flutter_weather_app/data/models/weather_model.dart';

import '../../core/error/exception_handlers.dart';

abstract class Service {
  Future<WeatherModel> getWeatherByCityName(String cityName);

  Future<WeatherModel> getWeatherByLatLong(double lat, double long);
}

class ServiceImpl implements Service {
  final Dio dio;

  ServiceImpl(this.dio);

  @override
  Future<WeatherModel> getWeatherByCityName(String cityName) async {
    try{
      final response = await dio
          .get('/forecast?q=$cityName&appid=${AppStrings.apiKey}');
      print(response);
      return WeatherModel.fromJson(response.data);
    }on DioError catch (error) {
      print(error.type);
      print(error.message);
     return  processResponse(error.response);
      //return Left(Failure(error.message));
    }

  }

  @override
  Future<WeatherModel> getWeatherByLatLong(double lat, double long) async {
    try {
      final response = await dio
          .get('/forecast?lat=$lat&lon=$long&appid=${AppStrings.apiKey}');
      if(response.statusCode == 200){
        return WeatherModel.fromJson(response.data);
      }else{
        return processResponse(response);
      }
    }catch (e) {
      throw ExceptionHandlers().getExceptionString(e);
    }
  }
}


dynamic processResponse(Response<dynamic>? response) {
  switch (response?.statusCode) {
    case 400: //Bad request
      throw BadRequestException(jsonDecode(response!.data)['message']);
    case 401: //Unauthorized
      throw UnAuthorizedException(jsonDecode(response!.data)['message']);
    case 403: //Forbidden
      throw UnAuthorizedException(jsonDecode(response!.data)['message']);
    case 404: //Resource Not Found
      throw NotFoundException(jsonDecode(response!.data)['message']);
    case 500: //Internal Server Error
    default:
      throw FetchDataException(
          'Something went wrong! ${response!.statusCode}');
  }
}
