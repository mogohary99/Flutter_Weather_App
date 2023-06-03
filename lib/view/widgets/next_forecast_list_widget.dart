import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/extensions/time_extensions.dart';
import 'package:flutter_weather_app/data/models/weather_model.dart';

import 'forecast_day_card.dart';

class NextForecastListWidget extends StatelessWidget {
  final WeatherModel weatherModel;
  const NextForecastListWidget({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    var maxWeather = weatherModel.weatherDayData[0];
    return ListView.builder(
      itemCount: weatherModel.weatherDayData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        if (index > 0) {
          // var maxWeather = weatherModel.weatherDayData[index];
          var weatherPre = weatherModel.weatherDayData[index - 1];
          var weather = weatherModel.weatherDayData[index];
          if (weather.dateTime.isSameDay(weatherPre.dateTime)) {
            if(weather.temp >maxWeather.temp){
              maxWeather = weather;
            }
          }
          if (!weather.dateTime.isSameDay(weatherPre.dateTime)) {
            var newWeather =maxWeather;
            maxWeather =weather;
            return ForecastDayCard(
              weather: newWeather,
            );
          }
        }
        return const SizedBox();
      },
    );
  }
}
