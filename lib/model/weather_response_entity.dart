import 'package:clock_challenge/generated/json/base/json_convert_content.dart';

class WeatherResponse with JsonConvert<WeatherResponse> {
	String status;
	String count;
	String info;
	String infocode;
	List<WeatherResponseLife> lives;
}

class WeatherResponseLife with JsonConvert<WeatherResponseLife> {
	String province;
	String city;
	String adcode;
	String weather;
	String temperature;
	String winddirection;
	String windpower;
	String humidity;
	String reporttime;
}
