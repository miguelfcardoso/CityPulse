import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';
import '../config/app_config.dart';

/// Service to fetch weather data from Open Meteo API
class WeatherService {
  /// Fetch current weather for the configured city
  static Future<Weather> getCurrentWeather() async {
    try {
      final url = Uri.parse(
        '${AppConfig.weatherApiBaseUrl}/forecast?'
        'latitude=${AppConfig.cityLatitude}&'
        'longitude=${AppConfig.cityLongitude}&'
        'current=temperature_2m,relative_humidity_2m,weather_code,wind_speed_10m&'
        'timezone=auto',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as Map<String, dynamic>;
        return Weather.fromJson(jsonData);
      } else {
        throw Exception(
          'Falha ao obter dados meteorológicos: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Erro ao conectar ao serviço meteorológico: $e');
    }
  }
}

