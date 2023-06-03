class CityModel {
  final String name;
  final double lat;
  final double long;

  CityModel({
    required this.name,
    required this.lat,
    required this.long,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        name: json['name'],
        lat: json['latitude'],
        long: json['longitude'],
      );
}
