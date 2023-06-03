import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather_app/controller/degree_cubit/degree_cubit.dart';
import 'package:flutter_weather_app/controller/home_cubit/home_cubit.dart';
import 'package:flutter_weather_app/core/extensions/extensions.dart';
import 'package:flutter_weather_app/core/extensions/icon_extension.dart';
import 'package:flutter_weather_app/core/extensions/weather_extension.dart';
import 'package:flutter_weather_app/data/models/weather_model.dart';
import 'package:flutter_weather_app/view/widgets/custom_error_widget.dart';
import 'package:flutter_weather_app/view/widgets/five_hour_weather.dart';
import 'package:flutter_weather_app/view/widgets/loading_widget.dart';
import 'package:flutter_weather_app/view/widgets/next.dart';
import 'package:flutter_weather_app/view/widgets/next_forecast_list_widget.dart';
import 'package:flutter_weather_app/view/widgets/top_appbar.dart';
import 'package:flutter_weather_app/view/widgets/weather_conditionsRow.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is GetCityWeatherSuccessState) {
              WeatherModel weatherModel = state.weatherModel;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const TopAppBar(),
                    20.0.h(context),
                    Text(
                      weatherModel.cityName,
                      style: context.titleLarge,
                    ),
                    8.0.h(context),
                    Text(
                      DateFormat.yMMMd()
                          .format(weatherModel.weatherDayData[0].dateTime),
                      style: context.displayMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: SvgPicture.asset(
                        weatherModel.weatherDayData[0].icon.getSvgIcon,
                        width: 180.0.pW(context),
                      ),
                    ),
                    BlocBuilder<DegreeCubit, DegreeState>(
                      builder: (context, state) {
                        var cubit = DegreeCubit.get(context);
                        return Text(
                          cubit.getDegreeType(
                              weatherModel.weatherDayData[0].temp),
                          style: context.displayLarge,
                        );
                      },
                    ),
                    20.0.h(context),
                    WeatherConditionsRow(
                      weather: weatherModel.weatherDayData[0],
                    ),
                    FiveHourWeather(weatherModel: weatherModel),
                    const NextForecastRowTitleAndIcon(),
                    NextForecastListWidget(weatherModel: weatherModel),
                    50.0.h(context),
                  ],
                ),
              );
            } else if (state is GetCityWeatherErrorState) {
              return CustomErrorWidget(error: state.error);
            } else {
              return const LoadingWidget();
            }
          },
        ),
      ),
    );
  }
}
