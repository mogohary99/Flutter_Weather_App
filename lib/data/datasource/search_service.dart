import 'package:dio/dio.dart';
import 'package:flutter_weather_app/data/models/city_model.dart';

import '../../core/error/exception_handlers.dart';

abstract class SearchService {
  Future<CityModel> searchByCityName(String cityName);
}

class SearchServiceImpl implements SearchService {
  final Dio dio;

  SearchServiceImpl({required this.dio});

  @override
  Future<CityModel> searchByCityName(String cityName) async {
    try {
      final res = await dio.get(
        'https://api.api-ninjas.com/v1/city?name=$cityName',
        options: Options(
            headers: {'X-Api-Key': 'ADD YOUR API KEY'}),
      );
      print(res);
      return CityModel.fromJson(res.data[0]);
    } catch (e) {
      print(e);
      throw ExceptionHandlers().getExceptionString(e);
    }
  }
}
