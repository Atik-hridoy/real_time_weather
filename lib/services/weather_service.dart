import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/utils/constants.dart';
import 'package:weather/models/weather_model.dart';

class WeatherService {
  Future<WeatherModel> getWeatherData(String cityName) async {
    try {
      var url = Uri.https(
        'api.openweathermap.org',
        '/data/2.5/weather',
        {'q': cityName, 'units': 'metric', 'appid': apiKey},
      );

      final http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedJson = json.decode(response.body);
        return WeatherModel.fromMap(decodedJson);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Failed to load weather data');
    }
  }
}
