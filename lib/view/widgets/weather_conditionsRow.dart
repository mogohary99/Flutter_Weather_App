import 'package:flutter/material.dart';
import 'package:flutter_weather_app/view/widgets/weather_conditions_card.dart';

import '../../data/models/weather_model.dart';

class WeatherConditionsRow extends StatelessWidget {
  const WeatherConditionsRow({
  super.key,
  required this.weather,
  });

  final WeatherDayData weather;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        WeatherConditionsCard(
          title: 'Wind',
          data:
          '${weather.windSpeed.round()}km/h',
        ),
        WeatherConditionsCard(
          title: 'Humidity',
          data:
          '${weather.humidity.toInt()}%',
        ),
        WeatherConditionsCard(
          title: 'Pressure',
          data:
          '${weather.pressure.toInt()}',
        ),
      ],
    );
  }
}
