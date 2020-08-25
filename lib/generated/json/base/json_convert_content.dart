// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:clock_challenge/model/weather_entity.dart';
import 'package:clock_challenge/generated/json/weather_entity_helper.dart';
import 'package:clock_challenge/model/location_response_entity.dart';
import 'package:clock_challenge/generated/json/location_response_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {			case WeatherResponse:
			return weatherEntityFromJson(data as WeatherResponse, json) as T;			case WeatherNow:
			return weatherNowFromJson(data as WeatherNow, json) as T;			case WeatherRefer:
			return weatherReferFromJson(data as WeatherRefer, json) as T;			case LocationResponse:
			return locationResponseFromJson(data as LocationResponse, json) as T;			case Location:
			return locationFromJson(data as Location, json) as T;			case LocationResponseRefer:
			return locationResponseReferFromJson(data as LocationResponseRefer, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {			case WeatherResponse:
			return weatherEntityToJson(data as WeatherResponse);			case WeatherNow:
			return weatherNowToJson(data as WeatherNow);			case WeatherRefer:
			return weatherReferToJson(data as WeatherRefer);			case LocationResponse:
			return locationResponseToJson(data as LocationResponse);			case Location:
			return locationToJson(data as Location);			case LocationResponseRefer:
			return locationResponseReferToJson(data as LocationResponseRefer);    }
    return data as T;
  }
  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {			case 'WeatherEntity':
			return WeatherResponse().fromJson(json);			case 'WeatherNow':
			return WeatherNow().fromJson(json);			case 'WeatherRefer':
			return WeatherRefer().fromJson(json);			case 'LocationResponse':
			return LocationResponse().fromJson(json);			case 'Location':
			return Location().fromJson(json);			case 'LocationResponseRefer':
			return LocationResponseRefer().fromJson(json);    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {			case 'WeatherEntity':
			return List<WeatherResponse>();			case 'WeatherNow':
			return List<WeatherNow>();			case 'WeatherRefer':
			return List<WeatherRefer>();			case 'LocationResponse':
			return List<LocationResponse>();			case 'Location':
			return List<Location>();			case 'LocationResponseRefer':
			return List<LocationResponseRefer>();    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}