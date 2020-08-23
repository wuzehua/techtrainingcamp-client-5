import 'package:clock_challenge/model/location_response_entity.dart';

locationResponseFromJson(LocationResponse data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status']?.toString();
	}
	if (json['location'] != null) {
		data.location = new List<Location>();
		(json['location'] as List).forEach((v) {
			data.location.add(new Location().fromJson(v));
		});
	}
	if (json['refer'] != null) {
		data.refer = new LocationResponseRefer().fromJson(json['refer']);
	}
	return data;
}

Map<String, dynamic> locationResponseToJson(LocationResponse entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	if (entity.location != null) {
		data['location'] =  entity.location.map((v) => v.toJson()).toList();
	}
	if (entity.refer != null) {
		data['refer'] = entity.refer.toJson();
	}
	return data;
}

locationFromJson(Location data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['lat'] != null) {
		data.lat = json['lat']?.toString();
	}
	if (json['lon'] != null) {
		data.lon = json['lon']?.toString();
	}
	if (json['adm2'] != null) {
		data.adm2 = json['adm2']?.toString();
	}
	if (json['adm1'] != null) {
		data.adm1 = json['adm1']?.toString();
	}
	if (json['country'] != null) {
		data.country = json['country']?.toString();
	}
	if (json['tz'] != null) {
		data.tz = json['tz']?.toString();
	}
	if (json['utcOffset'] != null) {
		data.utcOffset = json['utcOffset']?.toString();
	}
	if (json['isDst'] != null) {
		data.isDst = json['isDst']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['rank'] != null) {
		data.rank = json['rank']?.toString();
	}
	if (json['fxLink'] != null) {
		data.fxLink = json['fxLink']?.toString();
	}
	return data;
}

Map<String, dynamic> locationToJson(Location entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['id'] = entity.id;
	data['lat'] = entity.lat;
	data['lon'] = entity.lon;
	data['adm2'] = entity.adm2;
	data['adm1'] = entity.adm1;
	data['country'] = entity.country;
	data['tz'] = entity.tz;
	data['utcOffset'] = entity.utcOffset;
	data['isDst'] = entity.isDst;
	data['type'] = entity.type;
	data['rank'] = entity.rank;
	data['fxLink'] = entity.fxLink;
	return data;
}

locationResponseReferFromJson(LocationResponseRefer data, Map<String, dynamic> json) {
	if (json['sources'] != null) {
		data.sources = json['sources']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['license'] != null) {
		data.license = json['license']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	return data;
}

Map<String, dynamic> locationResponseReferToJson(LocationResponseRefer entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['sources'] = entity.sources;
	data['license'] = entity.license;
	return data;
}