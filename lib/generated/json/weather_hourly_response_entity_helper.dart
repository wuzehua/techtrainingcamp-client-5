import 'package:clock_challenge/model/weather_hourly_response_entity.dart';

WeatherHourlyResponseFromJson(
    WeatherHourlyResponse data, Map<String, dynamic> json) {
  if (json['code'] != null) {
    data.code = json['code']?.toString();
  }
  if (json['updateTime'] != null) {
    data.updateTime = json['updateTime']?.toString();
  }
  if (json['fxLink'] != null) {
    data.fxLink = json['fxLink']?.toString();
  }
  if (json['hourly'] != null) {
    data.hourly = new List<WeatherHourly>();
    (json['hourly'] as List).forEach((v) {
      data.hourly.add(new WeatherHourly().fromJson(v));
    });
  }
  if (json['refer'] != null) {
    data.refer = new WeatherHourlyResponseRefer().fromJson(json['refer']);
  }
  return data;
}

Map<String, dynamic> WeatherHourlyResponseToJson(WeatherHourlyResponse entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['code'] = entity.code;
  data['updateTime'] = entity.updateTime;
  data['fxLink'] = entity.fxLink;
  if (entity.hourly != null) {
    data['hourly'] = entity.hourly.map((v) => v.toJson()).toList();
  }
  if (entity.refer != null) {
    data['refer'] = entity.refer.toJson();
  }
  return data;
}

WeatherHourlyFromJson(WeatherHourly data, Map<String, dynamic> json) {
  if (json['fxDate'] != null) {
    data.fxDate = json['fxDate']?.toString();
  }
  if (json['temp'] != null) {
    data.temp = json['temp']?.toString();
  }
  if (json['icon'] != null) {
    data.icon = json['icon']?.toString();
  }
  if (json['text'] != null) {
    data.text = json['text']?.toString();
  }
  if (json['wind360'] != null) {
    data.wind360 = json['wind360']?.toString();
  }
  if (json['windDir'] != null) {
    data.windDir = json['windDir']?.toString();
  }
  if (json['windScale'] != null) {
    data.windScale = json['windScale']?.toString();
  }
  if (json['windSpeed'] != null) {
    data.windSpeed = json['windSpeed']?.toString();
  }
  if (json['humidity'] != null) {
    data.humidity = json['humidity']?.toString();
  }
  if (json['pop'] != null) {
    data.pop = json['pop']?.toString();
  }
  if (json['precip'] != null) {
    data.precip = json['precip']?.toString();
  }
  if (json['pressure'] != null) {
    data.pressure = json['pressure']?.toString();
  }
  if (json['cloud'] != null) {
    data.cloud = json['cloud']?.toString();
  }
  if (json['dew'] != null) {
    data.dew = json['dew']?.toString();
  }
  if (json['snow'] != null) {
    data.snow = json['snow']?.toString();
  }
  if (json['ice'] != null) {
    data.ice = json['ice']?.toString();
  }
  return data;
}

Map<String, dynamic> WeatherHourlyToJson(WeatherHourly entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['fxDate'] = entity.fxDate;
  data['temp'] = entity.temp;
  data['icon'] = entity.icon;
  data['text'] = entity.text;
  data['wind360'] = entity.wind360;
  data['windDir'] = entity.windDir;
  data['windScale'] = entity.windScale;
  data['windSpeed'] = entity.windSpeed;
  data['humidity'] = entity.humidity;
  data['pop'] = entity.pop;
  data['precip'] = entity.precip;
  data['pressure'] = entity.pressure;
  data['cloud'] = entity.cloud;
  data['dew'] = entity.dew;
  data['snow'] = entity.snow;
  data['ice'] = entity.ice;
  return data;
}

weatherHourlyResponseReferFromJson(
    WeatherHourlyResponseRefer data, Map<String, dynamic> json) {
  if (json['sources'] != null) {
    data.sources =
        json['sources']?.map((v) => v?.toString())?.toList()?.cast<String>();
  }
  if (json['license'] != null) {
    data.license =
        json['license']?.map((v) => v?.toString())?.toList()?.cast<String>();
  }
  return data;
}

Map<String, dynamic> weatherHourlyResponseReferToJson(
    WeatherHourlyResponseRefer entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['sources'] = entity.sources;
  data['license'] = entity.license;
  return data;
}
