/// This weather service is supported by Amap
/// Document Link: https://lbs.amap.com/api/webservice/guide/api/weatherinfo/#limit

import 'package:dio/dio.dart';
import 'package:clock_challenge/model/weather_response_entity.dart';

class HttpServiceForWeather {
  static HttpServiceForWeather _service;

  static final String _locationApiURL =
      'https://restapi.amap.com/v3/weather/weatherInfo?';
  static final String _apiKey = '54a000b75a238ca990ca9cad31c86493';

  Dio _dio;


  HttpServiceForWeather._internal() {
    _dio = Dio();
  }

  factory HttpServiceForWeather.getService() {
    return _getInstance();
  }

  static HttpServiceForWeather _getInstance() {
    if (_service == null) {
      _service = HttpServiceForWeather._internal();
    }

    return _service;
  }


  Future<WeatherResponse> getWeather(String city, String weatherType, String returnFormat) async {
    Response response = await _dio.get(_locationApiURL,
        queryParameters: {
          'key': _apiKey,
          'city': city,
          'extensions' : weatherType,
          'output' : returnFormat
        });

    WeatherResponse weatherResponse = WeatherResponse()
        .fromJson(response.data);

    return weatherResponse;
  }

}
