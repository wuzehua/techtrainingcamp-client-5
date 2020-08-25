import 'package:clock_challenge/model/location_response_entity.dart';
import 'package:clock_challenge/model/weather_entity.dart';
import 'package:dio/dio.dart';

class HttpService {
  static HttpService _service;

  static final String _locationApiURL = 
      'https://geoapi.heweather.net/v2/city/lookup';
  static final String _apiKey = '5b65537b921742969413515cbb1dbc19';

  static final String _weatherApiURL =
      'https://devapi.heweather.net/v7/weather/now';

  Dio _dio;
  
  
  HttpService._internal() {
    _dio = Dio();
  }

  factory HttpService.getService() {
    return _getInstance();
  }

  static HttpService _getInstance() {
    if (_service == null) {
      _service = HttpService._internal();
    }

    return _service;
  }


  Future<LocationResponse> getLocations(String location) async {
    Response response = await _dio.get(_locationApiURL,
                        queryParameters: {
                          'key': _apiKey,
                          'location': location
                        });

    LocationResponse locationResponse = LocationResponse()
        .fromJson(response.data);

    return locationResponse;
  }

  Future<WeatherResponse> getWeatherNow(String locationID) async {
    Response response = await _dio.get(_weatherApiURL,
                                      queryParameters: {
                                        'key': _apiKey,
                                        'location': locationID
                                      });

    WeatherResponse weatherResponse = WeatherResponse().fromJson(response.data);
    return weatherResponse;
  }

}