/// Weather data model
class Weather {
  final double temperature;
  final String condition;
  final int weatherCode;
  final double windSpeed;
  final int humidity;

  Weather({
    required this.temperature,
    required this.condition,
    required this.weatherCode,
    required this.windSpeed,
    required this.humidity,
  });

  /// Create from Open Meteo API JSON
  factory Weather.fromJson(Map<String, dynamic> json) {
    final current = json['current'] as Map<String, dynamic>;
    final weatherCode = current['weather_code'] as int? ?? 0;

    return Weather(
      temperature: (current['temperature_2m'] as num?)?.toDouble() ?? 0.0,
      weatherCode: weatherCode,
      condition: _getConditionFromCode(weatherCode),
      windSpeed: (current['wind_speed_10m'] as num?)?.toDouble() ?? 0.0,
      humidity: current['relative_humidity_2m'] as int? ?? 0,
    );
  }

  /// Map weather codes to conditions (WMO codes)
  static String _getConditionFromCode(int code) {
    if (code == 0) return 'Céu limpo';
    if (code <= 3) return 'Parcialmente nublado';
    if (code <= 49) return 'Nevoeiro';
    if (code <= 59) return 'Chuviscos';
    if (code <= 69) return 'Chuva';
    if (code <= 79) return 'Neve';
    if (code <= 84) return 'Aguaceiros';
    if (code <= 99) return 'Trovoada';
    return 'Desconhecido';
  }

  /// Get weather icon based on code
  String get icon {
    if (weatherCode == 0) return '☀️';
    if (weatherCode <= 3) return '⛅';
    if (weatherCode <= 49) return '🌫️';
    if (weatherCode <= 59) return '🌦️';
    if (weatherCode <= 69) return '🌧️';
    if (weatherCode <= 79) return '❄️';
    if (weatherCode <= 84) return '🌧️';
    if (weatherCode <= 99) return '⛈️';
    return '🌡️';
  }
}

