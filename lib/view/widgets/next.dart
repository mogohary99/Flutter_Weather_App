import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/extensions/extensions.dart';

class NextForecastRowTitleAndIcon extends StatelessWidget {
  const NextForecastRowTitleAndIcon({
  super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 30,
        bottom: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Next Forecast',
            style: context.displayMedium!.copyWith(fontSize: 18),
          ),
          const Icon(
            Icons.calendar_month,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}