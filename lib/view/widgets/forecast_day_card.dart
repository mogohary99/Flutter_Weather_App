import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather_app/controller/degree_cubit/degree_cubit.dart';
import 'package:flutter_weather_app/core/extensions/extensions.dart';
import 'package:flutter_weather_app/core/extensions/icon_extension.dart';
import 'package:flutter_weather_app/core/extensions/weather_extension.dart';
import 'package:intl/intl.dart';

import '../../data/models/weather_model.dart';

class ForecastDayCard extends StatelessWidget {
  final WeatherDayData weather;

  const ForecastDayCard

  ({
  super.key,
  required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff141332),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.EEEE().format(weather.dateTime),
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              8.0.h(context),
              Text(
                DateFormat.MMMd().format(weather.dateTime),
                style: context.displayMedium,
              ),
            ],
          ),
          BlocBuilder<DegreeCubit, DegreeState>(
            builder: (context, state) {
              var cubit = DegreeCubit.get(context);
              return Text(
                cubit.getDegreeType(weather.maxTemp),
                style: context.titleLarge,
              );
            },
          ),
          SvgPicture.asset(
            weather.icon.getSvgIcon,
            height: 30,
          ),
        ],
      ),
    );
  }
}
