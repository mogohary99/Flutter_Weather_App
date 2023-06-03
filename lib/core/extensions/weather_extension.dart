extension Temp on double {
  String get toCelsius => '${(this  - 273.15).toInt()}\u{00B0}C';
  String get toFahrenheit => '${((this - 273.15) * 9/5 + 32).toInt()}\u{00B0}F';
}