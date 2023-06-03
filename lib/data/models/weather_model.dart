class WeatherModel {
  final int id;
  final String cityName;
  final List<WeatherDayData> weatherDayData;

  WeatherModel({
    required this.id,
    required this.cityName,
    required this.weatherDayData,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        id: json['city']['id'],
        cityName: json['city']['name'],
        weatherDayData: List<WeatherDayData>.from(
            json['list'].map((x) => WeatherDayData.fromJson(x))),
      );
}

class WeatherDayData {
  final DateTime dateTime;
  final double temp;
  final double pressure;
  final double humidity;
  final String main;
  final String description;
  final double windSpeed;
  final String icon;
  final double maxTemp;

  WeatherDayData({
    required this.dateTime,
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.main,
    required this.description,
    required this.windSpeed,
    required this.icon,
    required this.maxTemp,
  });

  factory WeatherDayData.fromJson(Map<String, dynamic> json) => WeatherDayData(
        dateTime: DateTime.parse(json['dt_txt']),
        temp: json['main']['temp'].toDouble(),
        pressure: json['main']['pressure'].toDouble(),
        humidity: json['main']['humidity'].toDouble(),
        main: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        windSpeed: json['wind']['speed'].toDouble(),
        icon: json['weather'][0]['icon'],
    maxTemp:  json['main']['temp_max'].toDouble()
      );
}
