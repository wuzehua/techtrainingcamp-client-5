import 'package:clock_challenge/generated/json/base/json_convert_content.dart';

class LocationResponse with JsonConvert<LocationResponse> {
	String status;
	List<Location> location;
	LocationResponseRefer refer;
}

class Location with JsonConvert<Location> {
	String name;
	String id;
	String lat;
	String lon;
	String adm2;
	String adm1;
	String country;
	String tz;
	String utcOffset;
	String isDst;
	String type;
	String rank;
	String fxLink;
}

class LocationResponseRefer with JsonConvert<LocationResponseRefer> {
	List<String> sources;
	List<String> license;
}
