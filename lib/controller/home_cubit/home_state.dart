part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class GetCityWeatherLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class GetCityWeatherSuccessState extends HomeState {
  final WeatherModel weatherModel;

  const GetCityWeatherSuccessState({required this.weatherModel});
  @override
  List<Object> get props => [weatherModel];
}

class GetCityWeatherErrorState extends HomeState {
  final String error;

  const GetCityWeatherErrorState({required this.error});
  @override
  List<Object> get props => [error];
}

class GetCurrentPositionLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class GetCurrentPositionErrorState extends HomeState {
  final String error;

  const GetCurrentPositionErrorState({required this.error});
  @override
  List<Object> get props => [error];
}
