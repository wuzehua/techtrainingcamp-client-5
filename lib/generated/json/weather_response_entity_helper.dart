import 'package:clock_challenge/model/weather_response_entity.dart';

weatherResponseEntityFromJson(WeatherResponse data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status']?.toString();
	}
	if (json['count'] != null) {
		data.count = json['count']?.toString();
	}
	if (json['info'] != null) {
		data.info = json['info']?.toString();
	}
	if (json['infocode'] != null) {
		data.infocode = json['infocode']?.toString();
	}
	if (json['lives'] != null) {
		data.lives = new List<WeatherResponseLife>();
		(json['lives'] as List).forEach((v) {
			data.lives.add(new WeatherResponseLife().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> weatherResponseEntityToJson(WeatherResponse entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	data['count'] = entity.count;
	data['info'] = entity.info;
	data['infocode'] = entity.infocode;
	if (entity.lives != null) {
		data['lives'] =  entity.lives.map((v) => v.toJson()).toList();
	}
	return data;
}

weatherResponseLifeFromJson(WeatherResponseLife data, Map<String, dynamic> json) {
	if (json['province'] != null) {
		data.province = json['province']?.toString();
	}
	if (json['city'] != null) {
		data.city = json['city']?.toString();
	}
	if (json['adcode'] != null) {
		data.adcode = json['adcode']?.toString();
	}
	if (json['weather'] != null) {
		data.weather = json['weather']?.toString();
	}
	if (json['temperature'] != null) {
		data.temperature = json['temperature']?.toString();
	}
	if (json['winddirection'] != null) {
		data.winddirection = json['winddirection']?.toString();
	}
	if (json['windpower'] != null) {
		data.windpower = json['windpower']?.toString();
	}
	if (json['humidity'] != null) {
		data.humidity = json['humidity']?.toString();
	}
	if (json['reporttime'] != null) {
		data.reporttime = json['reporttime']?.toString();
	}
	return data;
}

Map<String, dynamic> weatherResponseLifeToJson(WeatherResponseLife entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['province'] = entity.province;
	data['city'] = entity.city;
	data['adcode'] = entity.adcode;
	data['weather'] = entity.weather;
	data['temperature'] = entity.temperature;
	data['winddirection'] = entity.winddirection;
	data['windpower'] = entity.windpower;
	data['humidity'] = entity.humidity;
	data['reporttime'] = entity.reporttime;
	return data;
}