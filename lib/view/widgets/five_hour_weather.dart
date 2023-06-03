import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_weather_app/controller/degree_cubit/degree_cubit.dart';
import 'package:flutter_weather_app/core/extensions/extensions.dart';
import 'package:flutter_weather_app/core/extensions/icon_extension.dart';
import 'package:flutter_weather_app/core/extensions/weather_extension.dart';
import 'package:intl/intl.dart';

import '../../data/models/weather_model.dart';

class FiveHourWeather extends StatelessWidget {
  const FiveHourWeather

  ({
  super.key,
  required this.weatherModel,
  });

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0.pH(context),
      margin: const EdgeInsets.only(top: 20),
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var weather = weatherModel.weatherDayData[index];
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                SvgPicture.asset(
                  weather.icon.getSvgIcon,
                  height: 30,
                ),
                8.0.h(context),
                BlocBuilder<DegreeCubit, DegreeState>(
                  builder: (context, state) {
                    var cubit = DegreeCubit.get(context);
                    return Text(
                     cubit.getDegreeType(weather.temp),
                      style: context.titleLarge,
                    );
                  },
                ),
                8.0.h(context),
                Text(
                  DateFormat.Hm().format(weather.dateTime),
                  style: context.displayMedium,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
