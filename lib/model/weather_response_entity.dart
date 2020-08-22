import 'package:clock_challenge/generated/json/base/json_convert_content.dart';

class WeatherResponse with JsonConvert<WeatherResponse> {
  String status;
  String count;
  String info;
  String infoCode;
  LivesWeather lives;
}

class LivesWeather with JsonConvert<LivesWeather> {
  String province;
  String city;
  String adCode;
  String weather;
  String temperature;
  String windDirection;
  String windPower;
  String humidity;
  String reportTime;
}