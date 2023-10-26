import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherRepository {
  Future<Map<String, dynamic>> fetchData(String city) async {
    final apiKey = 'http://localhost:1003';
    final endpoint = 'https://cdn.weatherapi.com/weather/128x128/day/116.png';

    final response = await http.get(Uri.parse('$endpoint?q=$city&apiKey=$apiKey'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
