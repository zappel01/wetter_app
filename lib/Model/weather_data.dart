class WeatherData {
  double latitude;
  double longitude;
  WeatherDataCurrent current;

  factory WeatherData.fromMap(Map<String, dynamic> json) {
    return WeatherData(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        current: WeatherDataCurrent.fromMap(json["current"]));
  }

  WeatherData(
      {required this.latitude, required this.longitude, required this.current});
}

class WeatherDataCurrent {
  final DateTime time;
  double temperature_2m;
  double apparent_temperature;
  int is_day;
  double precipitation;

  factory WeatherDataCurrent.fromMap(Map<String, dynamic> json) {
    final time = DateTime.parse(json["time"]);
    return WeatherDataCurrent(
        time: time,
        temperature_2m: json["temperature_2m"].toDouble(),
        apparent_temperature: json["apparent_temperature"].toDouble(),
        is_day: json["is_day"],
        precipitation: json["precipitation"].toDouble());
  }

  WeatherDataCurrent(
      {required this.time,
      required this.temperature_2m,
      required this.apparent_temperature,
      required this.is_day,
      required this.precipitation});
}
