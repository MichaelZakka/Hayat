import 'dart:convert';

import 'package:hayat/data/models/response/weather_api_response.dart';
import 'package:http/http.dart' as http;
import 'package:hayat/data/constant/api_constant.dart';

class WeatherRepo {
  getWeather() async {
    final response = await http.get(Uri.parse(WEATEHR));
    print('object');
    print(response.body);
    final js = jsonDecode(response.body);
    return WeatherResponse.fromJson(js);
  }
}
