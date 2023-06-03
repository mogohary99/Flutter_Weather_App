import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/core/error/exception_handlers.dart';
import 'package:flutter_weather_app/data/datasource/location_service.dart';
import 'package:flutter_weather_app/data/datasource/search_service.dart';
import 'package:flutter_weather_app/data/datasource/service.dart';
import 'package:flutter_weather_app/data/models/weather_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final Service service;
  final LocationService locationService;

  HomeCubit( {
    required this.service,
    required this.locationService,
  }) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);


  Future<void> getCityWeather() async {
    emit(GetCityWeatherLoadingState());
    //akaa
    try {
      var res = await service.getWeatherByCityName('akaa');
      print(res);
      emit(GetCityWeatherSuccessState(weatherModel: res));
    } catch (e) {
      print(e);
      emit(GetCityWeatherErrorState(error: ExceptionHandlers().getExceptionString(e)));
    }
  }

  Future<void> getCityWeatherByLatLong(double lat ,double long) async {
    emit(GetCityWeatherLoadingState());
    //akaa
    try {
      var res = await service.getWeatherByLatLong(lat, long);
      print(res);
      emit(GetCityWeatherSuccessState(weatherModel: res));
    } catch (e) {
      print(e);
      emit(GetCityWeatherErrorState(error: e.toString()));
    }
  }

 Future<void> getCurrentPosition()async{
    emit(GetCurrentPositionLoadingState());
    try{
      var res = await locationService.getCurrentPosition();
      print(res);
      if(res !=null){
        getCityWeatherByLatLong(res.latitude, res.longitude);
      }
    }catch(e){
      print(e);
      emit(GetCurrentPositionErrorState(error: e.toString()));
    }
 }

}
