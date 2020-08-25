import 'package:clock_challenge/model/weather_entity.dart';

weatherEntityFromJson(WeatherResponse data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['updateTime'] != null) {
		data.updateTime = json['updateTime']?.toString();
	}
	if (json['fxLink'] != null) {
		data.fxLink = json['fxLink']?.toString();
	}
	if (json['now'] != null) {
		data.now = new WeatherNow().fromJson(json['now']);
	}
	if (json['refer'] != null) {
		data.refer = new WeatherRefer().fromJson(json['refer']);
	}
	return data;
}

Map<String, dynamic> weatherEntityToJson(WeatherResponse entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['updateTime'] = entity.updateTime;
	data['fxLink'] = entity.fxLink;
	if (entity.now != null) {
		data['now'] = entity.now.toJson();
	}
	if (entity.refer != null) {
		data['refer'] = entity.refer.toJson();
	}
	return data;
}

weatherNowFromJson(WeatherNow data, Map<String, dynamic> json) {
	if (json['obsTime'] != null) {
		data.obsTime = json['obsTime']?.toString();
	}
	if (json['temp'] != null) {
		data.temp = json['temp']?.toString();
	}
	if (json['feelsLike'] != null) {
		data.feelsLike = json['feelsLike']?.toString();
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
	if (json['precip'] != null) {
		data.precip = json['precip']?.toString();
	}
	if (json['pressure'] != null) {
		data.pressure = json['pressure']?.toString();
	}
	if (json['vis'] != null) {
		data.vis = json['vis']?.toString();
	}
	if (json['cloud'] != null) {
		data.cloud = json['cloud']?.toString();
	}
	if (json['dew'] != null) {
		data.dew = json['dew']?.toString();
	}
	return data;
}

Map<String, dynamic> weatherNowToJson(WeatherNow entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['obsTime'] = entity.obsTime;
	data['temp'] = entity.temp;
	data['feelsLike'] = entity.feelsLike;
	data['icon'] = entity.icon;
	data['text'] = entity.text;
	data['wind360'] = entity.wind360;
	data['windDir'] = entity.windDir;
	data['windScale'] = entity.windScale;
	data['windSpeed'] = entity.windSpeed;
	data['humidity'] = entity.humidity;
	data['precip'] = entity.precip;
	data['pressure'] = entity.pressure;
	data['vis'] = entity.vis;
	data['cloud'] = entity.cloud;
	data['dew'] = entity.dew;
	return data;
}

weatherReferFromJson(WeatherRefer data, Map<String, dynamic> json) {
	if (json['sources'] != null) {
		data.sources = json['sources']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['license'] != null) {
		data.license = json['license']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	return data;
}

Map<String, dynamic> weatherReferToJson(WeatherRefer entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['sources'] = entity.sources;
	data['license'] = entity.license;
	return data;
}