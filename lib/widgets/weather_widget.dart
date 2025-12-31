import 'package:flutter/material.dart';
import '../models/weather.dart';

/// Widget to display weather information with premium design
class WeatherWidget extends StatelessWidget {
  final Weather weather;

  const WeatherWidget({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withValues(alpha: 0.25),
            Colors.white.withValues(alpha: 0.15),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.3),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Weather icon
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withValues(alpha: 0.3),
                  Colors.white.withValues(alpha: 0.1),
                ],
              ),
            ),
            child: Text(
              weather.icon,
              style: const TextStyle(fontSize: 64),
            ),
          ),

          const SizedBox(height: 16),

          // Temperature
          Text(
            '${weather.temperature.toStringAsFixed(1)}°',
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 1,
              shadows: [
                Shadow(
                  offset: Offset(0, 2),
                  blurRadius: 8,
                  color: Colors.black26,
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Condition
          Text(
            weather.condition,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white.withValues(alpha: 0.9),
              letterSpacing: 0.5,
            ),
          ),

          const SizedBox(height: 20),

          // Weather details
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildWeatherDetail(
                  icon: Icons.water_drop_outlined,
                  label: '${weather.humidity}%',
                ),
                const SizedBox(width: 24),
                _buildWeatherDetail(
                  icon: Icons.air,
                  label: '${weather.windSpeed.toStringAsFixed(1)} km/h',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherDetail({
    required IconData icon,
    required String label,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Colors.white.withValues(alpha: 0.8),
          size: 18,
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.9),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

