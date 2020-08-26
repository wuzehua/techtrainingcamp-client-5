import 'package:clock_challenge/model/weather_hourly_response_entity.dart';
import 'package:flutter/material.dart';

class WeatherHourlyItem extends StatelessWidget {
  final WeatherHourly weatherHourly;
  final int index;
  final isInCelsius;

  String _celsiusUnit = "℃";
  String _fahrenheitUnit = "℉";

  WeatherHourlyItem(this.weatherHourly, this.index, this.isInCelsius, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return SizedBox(
      width: 70,
      child: Padding(
        padding: const EdgeInsets.only(
            top: 20.0, bottom: 2.0, left: 2.0, right: 2.0),
        child: FlatButton(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      ((DateTime.now().hour + index + 1) % 24).toString() +
                          ":00",
                      style:
                          TextStyle(fontSize: 13, color: themeData.hintColor),
                    ),
                    Image.asset(
                      'assets/weather_icons/${weatherHourly.icon}.png',
                      width: 50,
                      height: 50,
                    ),
                    Text(
                      '${weatherHourly.temp}' +
                          (isInCelsius ? _celsiusUnit : _fahrenheitUnit),
                      style:
                          TextStyle(fontSize: 14, color: themeData.hintColor),
                    ),
                    Text(
                      '${weatherHourly.text}',
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
