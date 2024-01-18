class WeatherModel {
  WeatherModel({
    this.name,
    this.weeklyWeather,
  });

  String? name;
  List<WeeklyWeather?>? weeklyWeather;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        name: json["name"],
        weeklyWeather: json["weekly_weather"] == null
            ? []
            : List<WeeklyWeather?>.from(
                json["weekly_weather"]!.map((x) => WeeklyWeather.fromJson(x))),
      );
}

/*{"latitude":48.78,"longitude":9.18,
"generationtime_ms":0.07998943328857422,"utc_offset_seconds":3600,
"timezone":"Europe/Berlin","timezone_abbreviation":"CET","elevation":253.0,"hourly_units":{"time":"iso8601",
"temperature_2m":"°C",
"relative_humidity_2m":"%",
"precipitation":"mm",
"snowfall":"cm",
"wind_direction_10m":"°",
"is_day":""},
"hourly":{"time":["2024-01-17T15:00","2024-01-17T16:00","2024-01-17T17:00","2024-01-17T18:00","2024-01-17T19:00","2024-01-17T20:00","2024-01-17T21:00","2024-01-17T22:00","2024-01-17T23:00","2024-01-18T00:00","2024-01-18T01:00","2024-01-18T02:00","2024-01-18T03:00","2024-01-18T04:00","2024-01-18T05:00","2024-01-18T06:00","2024-01-18T07:00","2024-01-18T08:00","2024-01-18T09:00","2024-01-18T10:00","2024-01-18T11:00","2024-01-18T12:00","2024-01-18T13:00","2024-01-18T14:00"],
"temperature_2m":[7.2,8.0,8.7,9.0,8.9,9.2,9.2,9.2,9.2,8.9,8.5,8.2,8.4,8.2,8.1,8.0,7.8,3.4,1.9,0.9,0.4,0.2,0.0,-0.3],
"relative_humidity_2m":[84,85,86,87,87,87,87,87,85,86,87,88,87,86,86,86,89,95,91,93,94,95,93,92],
"precipitation":[0.50,0.10,0.50,0.40,0.20,0.10,0.10,0.10,0.00,0.00,0.00,0.10,0.00,0.10,0.10,0.20,0.60,0.30,0.50,0.50,0.80,0.70,0.80,0.80],
"snowfall":[0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.14,0.35,0.35],
"wind_direction_10m":[188,195,203,201,204,210,203,209,211,210,212,205,209,207,205,205,251,3,318,315,318,323,316,309],
"is_day":[1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1]}}*/

class WeeklyWeather {
  WeeklyWeather({
    this.mainTemp,
    this.mainWind,
    this.mainHumidity,
    this.mainImg,
    this.day,
    this.allTime,
  });

  String? mainTemp;
  String? mainWind;
  String? mainHumidity;
  String? mainImg;
  String? day;
  AllTime? allTime;

  factory WeeklyWeather.fromJson(Map<String, dynamic> json) => WeeklyWeather(
        mainTemp: json["main_temp"],
        mainWind: json["main_wind"],
        mainHumidity: json["main_humidity"],
        mainImg: json["main_img"],
        day: json["day"],
        allTime: AllTime.fromJson(json["all_time"]),
      );
}

class AllTime {
  AllTime({
    this.hour,
    this.wind,
    this.img,
    this.temps,
  });

  List<String?>? hour;
  List<String?>? wind;
  List<String?>? img;
  List<String?>? temps;

  factory AllTime.fromJson(Map<String, dynamic> json) => AllTime(
        hour: json["hour"] == null
            ? []
            : json["hour"] == null
                ? []
                : List<String?>.from(json["hour"]!.map((x) => x)),
        wind: json["wind"] == null
            ? []
            : json["wind"] == null
                ? []
                : List<String?>.from(json["wind"]!.map((x) => x)),
        img: json["img"] == null
            ? []
            : json["img"] == null
                ? []
                : List<String?>.from(json["img"]!.map((x) => x)),
        temps: json["temps"] == null
            ? []
            : json["temps"] == null
                ? []
                : List<String?>.from(json["temps"]!.map((x) => x)),
      );
}
