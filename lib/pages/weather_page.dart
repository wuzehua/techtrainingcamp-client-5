import 'package:clock_challenge/model/weather_entity.dart';
import 'package:clock_challenge/model/weather_hourly_response_entity.dart';
import 'package:clock_challenge/model/weather_three_days_response_entity.dart';
import 'package:clock_challenge/network/http_service.dart';
import 'package:clock_challenge/widgets/page_app_bar.dart';
import 'package:clock_challenge/widgets/weather_daily_item.dart';
import 'package:clock_challenge/widgets/weather_hourly_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage>
    with TickerProviderStateMixin {
  SharedPreferences _sharedPreferences;
  String _locationId = '101280101';
  String _weatherIcon = '999';
  String _cityName = '广州';

  String _celsiusUnit = "℃";
  String _fahrenheitUnit = "℉";

  bool isDay = true;
  bool isInCelsius = true;

  //=== now ===
  //实况观测时间
  String _obsTime = "N/A";

  //实况温度
  String _temp = "N/A";

  //实况天气状况的文字描述
  String _text = "N/A";

  //=== 24h ===
  List<WeatherHourly> _hourly;

  //=== 3d ===
  //预报当天最高温度
  String _tempMax = "N/A";

  //预报当天最低温度
  String _tempMin = "N/A";

  //日出
  String _sunrise = "00:00";

  //日落
  String _sunset = "00:00";

  //月出
  String _moonrise = "00:00";

  //月落
  String _moonset = "00:00";

  //濕度
  String _humidity = "N/A";

  List<WeatherThreeDays> _daily;

  String get locationIdKey {
    return 'locationId';
  }

  String get cityNameKey {
    return 'cityName';
  }

  _WeatherPageState() : super() {
    SharedPreferences.getInstance().then((sharedPre) {
      _sharedPreferences = sharedPre;
      _locationId = _sharedPreferences.getString(locationIdKey) ?? '101280101';
      _cityName = _sharedPreferences.getString(cityNameKey) ?? '广州';

      _fetchLiveWeather();
      _fetchThreeDayWeather();
      _fetchHourlyWeather();
      setState(() {});
    });
  }

  void _fetchLiveWeather() async {
    WeatherResponse weatherResponse =
        await HttpService.getService().getWeatherNow(_locationId);
    setState(() {
      _weatherIcon = weatherResponse.now.icon;
      _obsTime = weatherResponse.now.obsTime;
      _temp = weatherResponse.now.temp +
          (isInCelsius ? _celsiusUnit : _fahrenheitUnit);
      _text = weatherResponse.now.text;
    });
  }

  void _fetchHourlyWeather() async {
    WeatherHourlyResponse weatherHourlyResponse =
        await HttpService.getService().getWeatherHourly(_locationId);
    setState(() {
      _hourly = weatherHourlyResponse.hourly;
    });
  }

  bool _isTimeAfterOrEqual(String a, String b) {
    var aList = a.split(":");
    var bList = a.split(":");
    var aPure = aList[0] + aList[1];
    var bPure = bList[0] + bList[1];
    if (int.parse(aPure) <= int.parse(bPure))
      return true;
    else
      return false;
  }

  void _fetchThreeDayWeather() async {
    WeatherThreeDaysResponse weatherThreeDaysResponse =
        await HttpService.getService().getWeatherThreeDays(_locationId);
    setState(() {
      _daily = weatherThreeDaysResponse.daily;
      //主要獲取當天部分數據
      _tempMax = weatherThreeDaysResponse.daily[0].tempMax +
          (isInCelsius ? _celsiusUnit : _fahrenheitUnit);
      _tempMin = weatherThreeDaysResponse.daily[0].tempMin +
          (isInCelsius ? _celsiusUnit : _fahrenheitUnit);
      _sunrise = weatherThreeDaysResponse.daily[0].sunrise;
      _sunset = weatherThreeDaysResponse.daily[0].sunset;
      _moonrise = weatherThreeDaysResponse.daily[0].moonrise;
      _moonset = weatherThreeDaysResponse.daily[0].moonset;
      _humidity = weatherThreeDaysResponse.daily[0].humidity;

      if (_sunset != "N/A" && _sunrise != "N/A") {
        String currentTime = DateTime.now().hour.toString() +
            "：" +
            DateTime.now().minute.toString();
        if (_isTimeAfterOrEqual(_sunrise, currentTime)) {}
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
        appBar: PageAppBar(
          context,
          title: '实况天气',
        ),
        body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  _cityName,
                  style: new TextStyle(fontSize: 25),
                ),
                Image.asset(
                  'assets/weather_icons/$_weatherIcon.png',
                  width: 150,
                  height: 150,
                ),
                Text(
                  _temp,
                  style: new TextStyle(fontSize: 25),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 15, bottom: 15),
                  child: Column(
                    children: [
                      Text(_tempMax + "/" + _tempMin),
                      Text(_text),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Card(
                        color: Color(0x30A9A9A9),
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        clipBehavior: Clip.antiAlias,
                        semanticContainer: false,
                        child: Container(
                          margin: EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text("日出: " + _sunrise),
                                  Text("日落: " + _sunset)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: Color(0x30A9A9A9),
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        clipBehavior: Clip.antiAlias,
                        semanticContainer: false,
                        child: Container(
                          margin: EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text("月出: " + _moonrise),
                                  Text("月落: " + _moonset)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      new Stack(
                        alignment: Alignment.center,
                        children: [
                          new SizedBox(
                            height: 60,
                            width: 60,
                            child: new CircularProgressIndicator(
                                //0~1的浮点数，用来表示进度多少;如果 value 为 null 或空，则显示一个动画，否则显示一个定值
                                value: (_humidity != "N/A")
                                    ? (int.parse(_humidity) / 100.0)
                                    : 0.3,
                                //背景颜色
                                backgroundColor: Colors.grey,
                                //进度颜色
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.lightBlue)),
                          ),
                          new Text(
                            _humidity.toString() + " RH",
                            style: new TextStyle(
                                color: Colors.lightBlue, fontSize: 15),
                          )
                        ],
                      ),
                      Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: (_hourly != null) ? _hourly.length : 24,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if (_hourly != null && _hourly.length == 24) {
                          print(_hourly[index].text);
                          return WeatherHourlyItem(
                              _hourly[index], index, isInCelsius);
                        }
                        return null;
                      }),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: (_daily != null) ? _daily.length : 3,
                      scrollDirection: Axis.vertical,
                      controller: new ScrollController(keepScrollOffset: false),
                      itemBuilder: (context, index) {
                        if (_daily != null && _daily.length == 3) {
                          print(_daily[index].fxDate);
                          return WeatherDailyItem(
                              _daily[index], index, isInCelsius);
                        }
                        return null;
                      }),
                )
              ],
            )));
  }
}
