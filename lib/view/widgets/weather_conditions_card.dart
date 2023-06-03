import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/extensions/extensions.dart';

class WeatherConditionsCard extends StatelessWidget {
  final String title, data;

  const WeatherConditionsCard({
  super.key,
  required this.title,
  required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: context.displayMedium,
        ),
        8.0.h(context),
        Text(
          data,
          style: context.titleSmall,
        )
      ],
    );
  }
}