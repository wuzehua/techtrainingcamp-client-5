import 'package:clock_challenge/generated/json/base/json_convert_content.dart';

class WeatherThreeDaysResponse with JsonConvert<WeatherThreeDaysResponse> {
  String code;
  String updateTime;
  String fxLink;
  List<WeatherThreeDays> daily;
  WeatherThreeDaysResponseRefer refer;
}

class WeatherThreeDays with JsonConvert<WeatherThreeDays> {
  String fxDate;
  String sunrise;
  String sunset;
  String moonrise;
  String moonset;
  String tempMax;
  String tempMin;
  String iconDay;
  String textDay;
  String iconNight;
  String textNight;
  String wind360Day;
  String windDirDay;
  String windScaleDay;
  String windSpeedDay;
  String wind360Night;
  String windDirNight;
  String windScaleNight;
  String windSpeedNight;
  String humidity;
  String precip;
  String pressure;
  String vis;
  String uvIndex;
}

class WeatherThreeDaysResponseRefer
    with JsonConvert<WeatherThreeDaysResponseRefer> {
  List<String> sources;
  List<String> license;
}
