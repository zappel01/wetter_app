import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather/Model/weatherModel.dart';
import 'package:weather/Model/weather_data.dart';
import 'package:weather/View/Pages/bottomNavigationBar.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await loadJson();
    });
    super.initState();
  }

  List data = [];
  List<WeatherModel> weatherList = [];

  loadJson() async {
    const url =
        "https://api.open-meteo.com/v1/dwd-icon?latitude=48.8734&longitude=9.9174&hourly=temperature_2m,relative_humidity_2m,precipitation,snowfall,wind_direction_10m,is_day&timezone=Europe%2FBerlin&forecast_hours=24";

    Future<WeatherData?> parseData() async {
      try {
        final response = await get(Uri.parse(url));
        return WeatherData.fromMap(json.decode(response.body));
      } catch (e) {
        print("[JSON-Parse-Exception]: Weather Data could not be parsed: $e");
      }
      return null;
    }

    Timer(
        const Duration(seconds: 3),
        (() => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: ((context) => NavBar(
                      weatherModel: weatherList,
                    ))))));
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff060720),
        body: SizedBox(
          height: myHeight,
          width: myWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(''),
              const Text(
                'Wetter App',
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Creat by Sven Ziurawski',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: myHeight * 0.009,
                  ),
                  Image.asset(
                    'assets/loading1.gif',
                    height: myHeight * 0.015,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: myHeight * 0.02,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
