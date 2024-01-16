import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:weather/Model/weatherModel.dart';
import 'package:weather/Utils/staticFile.dart';

class Home extends StatefulWidget {
  List<WeatherModel> weatherModel = [];

  Home({super.key, required this.weatherModel});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await scrollToIndex();
    });
    find_myLocation_index();
    super.initState();
  }

  find_myLocation_index() {
    for (var i = 0; i < widget.weatherModel.length; i++) {
      if (widget.weatherModel[i].name == StaticFile.myLocation) {
        setState(() {
          StaticFile.myLocationIndex = i;
          complete1 = true;
        });
        break;
      }
    }
    find_hour_index();
  }

  DateTime time = DateTime.now();
  int hour_index = 0;
  bool complete1 = false;
  bool complete2 = false;

  find_hour_index() {
    String myTime;
    myTime = time.hour.toString();
    if (myTime.length == 1) {
      myTime = '0$myTime';
    }
    for (var i = 0;
        i <
            widget.weatherModel[StaticFile.myLocationIndex].weeklyWeather![0]!
                .allTime!.hour!.length;
        i++) {
      if (widget.weatherModel[StaticFile.myLocationIndex].weeklyWeather![0]!
              .allTime!.hour![i]!
              .substring(0, 2)
              .toString() ==
          myTime) {
        setState(() {
          hour_index = i;
          complete2 = true;
        });
        break;
      }
    }
  }

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  scrollToIndex() async {
    itemScrollController.scrollTo(
        index: hour_index,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCubic);
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
              children: [
                SizedBox(
                  height: myHeight * 0.03,
                ),
                Text(
                  widget.weatherModel[StaticFile.myLocationIndex].name
                      .toString(),
                  style: const TextStyle(fontSize: 40, color: Colors.white),
                ),
                SizedBox(
                  height: myHeight * 0.01,
                ),
                Text(
                  '16 Januar 2024'.toString(),
                  style: TextStyle(
                      fontSize: 20, color: Colors.white.withOpacity(0.5)),
                ),
                SizedBox(
                  height: myHeight * 0.05,
                ),
                Container(
                  height: myHeight * 0.05,
                  width: myWidth * 0.6,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(colors: [
                                  Color.fromARGB(255, 21, 85, 169),
                                  Color.fromARGB(255, 44, 162, 246),
                                ])),
                            child: const Center(
                              child: Text(
                                'Vorhersage',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            child: Center(
                              child: Text(
                                'Luftqualität',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 18),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: myHeight * 0.05,
                ),
                Image.asset(
                  widget.weatherModel[StaticFile.myLocationIndex]
                      .weeklyWeather![0]!.mainImg
                      .toString(),
                  height: myHeight * 0.3,
                  width: myWidth * 0.8,
                ),
                SizedBox(
                  height: myHeight * 0.05,
                ),
                SizedBox(
                  height: myHeight * 0.06,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Text(
                                'Temp',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 15),
                              ),
                              Text(
                                widget.weatherModel[StaticFile.myLocationIndex]
                                    .weeklyWeather![0]!.mainTemp
                                    .toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Text(
                                'Wind',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 15),
                              ),
                              Text(
                                widget.weatherModel[StaticFile.myLocationIndex]
                                    .weeklyWeather![0]!.mainWind
                                    .toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Text(
                                'Luftfeuchtigkeit',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 15),
                              ),
                              Text(
                                widget.weatherModel[StaticFile.myLocationIndex]
                                    .weeklyWeather![0]!.mainHumidity
                                    .toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: myHeight * 0.04,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: myWidth * 0.06),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Heute',
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                      Text(
                        'Vollständiger Bericht',
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: myHeight * 0.02,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(
                      left: myWidth * 0.03, bottom: myHeight * 0.03),
                  child: ScrollablePositionedList.builder(
                    itemScrollController: itemScrollController,
                    itemPositionsListener: itemPositionsListener,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.weatherModel[StaticFile.myLocationIndex]
                        .weeklyWeather![0]!.allTime!.hour!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: myWidth * 0.02,
                            vertical: myHeight * 0.01),
                        child: Container(
                          width: myWidth * 0.35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: hour_index == index
                                  ? null
                                  : Colors.white.withOpacity(0.05),
                              gradient: hour_index == index
                                  ? const LinearGradient(colors: [
                                      Color.fromARGB(255, 21, 85, 169),
                                      Color.fromARGB(255, 44, 162, 246),
                                    ])
                                  : null),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  widget
                                      .weatherModel[StaticFile.myLocationIndex]
                                      .weeklyWeather![0]!
                                      .allTime!
                                      .img![index]
                                      .toString(),
                                  height: myHeight * 0.04,
                                ),
                                SizedBox(
                                  width: myWidth * 0.04,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget
                                          .weatherModel[
                                              StaticFile.myLocationIndex]
                                          .weeklyWeather![0]!
                                          .allTime!
                                          .hour![index]
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    Text(
                                      widget
                                          .weatherModel[
                                              StaticFile.myLocationIndex]
                                          .weeklyWeather![0]!
                                          .allTime!
                                          .temps![index]
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 25, color: Colors.white),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ))
              ],
            )),
      ),
    );
  }
}
