import 'package:clock_challenge/model/weather_three_days_response_entity.dart';
import 'package:flutter/material.dart';

class WeatherDailyItem extends StatelessWidget {
  final WeatherThreeDays weatherDaily;
  final int index;
  final isInCelsius;

  String _celsiusUnit = "℃";
  String _fahrenheitUnit = "℉";

  WeatherDailyItem(this.weatherDaily, this.index, this.isInCelsius, {Key key})
      : super(key: key);

  List<String> weekDayList = [
    "星期日",
    "星期一",
    "星期二",
    "星期三",
    "星期四",
    "星期五",
    "星期六",
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(0.2),
        child: FlatButton(
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      DateTime.now()
                              .add(new Duration(days: index))
                              .month
                              .toString() +
                          "月" +
                          (DateTime.now().add(new Duration(days: index)).day)
                              .toString() +
                          "日" +
                          weekDayList[DateTime.now()
                              .add(new Duration(days: index))
                              .weekday],
                      style:
                          TextStyle(fontSize: 14, color: themeData.hintColor),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Image.asset(
                      'assets/weather_icons/${weatherDaily.iconDay}.png',
                      width: 35,
                      height: 35,
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      '${weatherDaily.tempMin}' +
                          (isInCelsius ? _celsiusUnit : _fahrenheitUnit) +
                          "~" +
                          '${weatherDaily.tempMax}' +
                          (isInCelsius ? _celsiusUnit : _fahrenheitUnit),
                      style:
                          TextStyle(fontSize: 14, color: themeData.hintColor),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
