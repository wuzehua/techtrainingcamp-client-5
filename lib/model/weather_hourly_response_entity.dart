import 'package:clock_challenge/generated/json/base/json_convert_content.dart';

class WeatherHourlyResponse with JsonConvert<WeatherHourlyResponse> {
  String code;
  String updateTime;
  String fxLink;
  List<WeatherHourly> hourly;
  WeatherHourlyResponseRefer refer;
}

class WeatherHourly with JsonConvert<WeatherHourly> {
  String fxDate;
  String temp;
  String icon;
  String text;
  String wind360;
  String windDir;
  String windScale;
  String windSpeed;
  String humidity;
  String pop;
  String precip;
  String pressure;
  String cloud;
  String dew;
  String snow;
  String ice;
}

class WeatherHourlyResponseRefer with JsonConvert<WeatherHourlyResponseRefer> {
  List<String> sources;
  List<String> license;
}
