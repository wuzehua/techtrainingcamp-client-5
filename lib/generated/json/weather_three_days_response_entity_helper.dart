import 'package:clock_challenge/model/weather_three_days_response_entity.dart';

WeatherThreeDaysResponseFromJson(
    WeatherThreeDaysResponse data, Map<String, dynamic> json) {
  if (json['code'] != null) {
    data.code = json['code']?.toString();
  }
  if (json['updateTime'] != null) {
    data.updateTime = json['updateTime']?.toString();
  }
  if (json['fxLink'] != null) {
    data.fxLink = json['fxLink']?.toString();
  }
  if (json['daily'] != null) {
    data.daily = new List<WeatherThreeDays>();
    (json['daily'] as List).forEach((v) {
      data.daily.add(new WeatherThreeDays().fromJson(v));
    });
  }
  if (json['refer'] != null) {
    data.refer = new WeatherThreeDaysResponseRefer().fromJson(json['refer']);
  }
  return data;
}

Map<String, dynamic> WeatherThreeDaysResponseToJson(
    WeatherThreeDaysResponse entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['code'] = entity.code;
  data['updateTime'] = entity.updateTime;
  data['fxLink'] = entity.fxLink;
  if (entity.daily != null) {
    data['daily'] = entity.daily.map((v) => v.toJson()).toList();
  }
  if (entity.refer != null) {
    data['refer'] = entity.refer.toJson();
  }
  return data;
}

WeatherThreeDaysFromJson(WeatherThreeDays data, Map<String, dynamic> json) {
  if (json['fxDate'] != null) {
    data.fxDate = json['fxDate']?.toString();
  }
  if (json['sunrise'] != null) {
    data.sunrise = json['sunrise']?.toString();
  }
  if (json['sunset'] != null) {
    data.sunset = json['sunset']?.toString();
  }
  if (json['moonrise'] != null) {
    data.moonrise = json['moonrise']?.toString();
  }
  if (json['moonset'] != null) {
    data.moonset = json['moonset']?.toString();
  }
  if (json['tempMax'] != null) {
    data.tempMax = json['tempMax']?.toString();
  }
  if (json['tempMin'] != null) {
    data.tempMin = json['tempMin']?.toString();
  }
  if (json['iconDay'] != null) {
    data.iconDay = json['iconDay']?.toString();
  }
  if (json['textDay'] != null) {
    data.textDay = json['textDay']?.toString();
  }
  if (json['iconNight'] != null) {
    data.iconNight = json['iconNight']?.toString();
  }
  if (json['textNight'] != null) {
    data.textNight = json['textNight']?.toString();
  }
  if (json['wind360Day'] != null) {
    data.wind360Day = json['wind360Day']?.toString();
  }
  if (json['windDirDay'] != null) {
    data.windDirDay = json['windDirDay']?.toString();
  }
  if (json['windScaleDay'] != null) {
    data.windScaleDay = json['windScaleDay']?.toString();
  }
  if (json['windSpeedDay'] != null) {
    data.windSpeedDay = json['windSpeedDay']?.toString();
  }
  if (json['wind360Night'] != null) {
    data.wind360Night = json['wind360Night']?.toString();
  }
  if (json['windDirNight'] != null) {
    data.windDirNight = json['windDirNight']?.toString();
  }
  if (json['windScaleNight'] != null) {
    data.windScaleNight = json['windScaleNight']?.toString();
  }
  if (json['windSpeedNight'] != null) {
    data.windSpeedNight = json['windSpeedNight']?.toString();
  }
  if (json['humidity'] != null) {
    data.humidity = json['humidity']?.toString();
  }
  if (json['precip'] != null) {
    data.precip = json['precip']?.toString();
  }
  if (json['pressure'] != null) {
    data.pressure = json['pressure']?.toString();
  }
  if (json['vis'] != null) {
    data.vis = json['vis']?.toString();
  }
  if (json['uvIndex'] != null) {
    data.uvIndex = json['uvIndex']?.toString();
  }
  return data;
}

Map<String, dynamic> WeatherThreeDaysToJson(WeatherThreeDays entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['fxDate'] = entity.fxDate;
  data['sunrise'] = entity.sunrise;
  data['sunset'] = entity.sunset;
  data['moonrise'] = entity.moonrise;
  data['moonset'] = entity.moonset;
  data['tempMax'] = entity.tempMax;
  data['tempMin'] = entity.tempMin;
  data['iconDay'] = entity.iconDay;
  data['textDay'] = entity.textDay;
  data['iconNight'] = entity.iconNight;
  data['textNight'] = entity.textNight;
  data['wind360Day'] = entity.wind360Day;
  data['windDirDay'] = entity.windDirDay;
  data['windScaleDay'] = entity.windScaleDay;
  data['windSpeedDay'] = entity.windSpeedDay;
  data['wind360Night'] = entity.wind360Night;
  data['windDirNight'] = entity.windDirNight;
  data['windScaleNight'] = entity.windScaleNight;
  data['windSpeedNight'] = entity.windSpeedNight;
  data['humidity'] = entity.humidity;
  data['precip'] = entity.precip;
  data['pressure'] = entity.pressure;
  data['vis'] = entity.vis;
  data['uvIndex'] = entity.uvIndex;
  return data;
}

weatherThreeDaysResponseReferFromJson(
    WeatherThreeDaysResponseRefer data, Map<String, dynamic> json) {
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

Map<String, dynamic> weatherThreeDaysResponseReferToJson(
    WeatherThreeDaysResponseRefer entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['sources'] = entity.sources;
  data['license'] = entity.license;
  return data;
}
