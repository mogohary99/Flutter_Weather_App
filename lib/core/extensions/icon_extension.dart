
import 'package:flutter_weather_app/core/utils/constants/assets_manager.dart';

/// Double Extensions

extension WeatherIcon on String {
String get getSvgIcon{
  switch(this){
    case '01d':
      return AppIcons.clearDay;
    case '01n':
      return AppIcons.clearNight;
    case '02n':
      return AppIcons.fewCloudsNight;
    case '02d':
      return AppIcons.fewCloudsDay;
    case '03n':
      return AppIcons.cloudy;
    case '03d':
      return AppIcons.cloudy;
    case '04n':
      return AppIcons.sleet;
    case '04d':
      return AppIcons.sleet;
    case '09n':
      return AppIcons.rain;
    case '09d':
      return AppIcons.rain;
    case '10n':
      return AppIcons.rain;
    case '10d':
      return AppIcons.rain;
    case '11n':
      return AppIcons.windy;
    case '11d':
      return AppIcons.windy;
    case '13n':
      return AppIcons.snow;
    case '13d':
      return AppIcons.snow;
    case '50n':
      return AppIcons.mist;
    case '50d':
      return AppIcons.mist;
    default:
      return AppIcons.clearDay;
  }
}
}

