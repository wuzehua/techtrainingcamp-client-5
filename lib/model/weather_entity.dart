import 'package:clock_challenge/generated/json/base/json_convert_content.dart';

class WeatherResponse with JsonConvert<WeatherResponse> {
	String code;
	String updateTime;
	String fxLink;
	WeatherNow now;
	WeatherRefer refer;
}

class WeatherNow with JsonConvert<WeatherNow> {
	String obsTime;
	String temp;
	String feelsLike;
	String icon;
	String text;
	String wind360;
	String windDir;
	String windScale;
	String windSpeed;
	String humidity;
	String precip;
	String pressure;
	String vis;
	String cloud;
	String dew;
}

class WeatherRefer with JsonConvert<WeatherRefer> {
	List<String> sources;
	List<String> license;
}
