import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/point_of_interest.dart';
import '../models/category.dart';

/// Service to load and manage Points of Interest data
class JsonDataService {
  static List<PointOfInterest>? _cachedPoints;

  /// Load all points of interest from JSON file
  static Future<List<PointOfInterest>> loadPointsOfInterest() async {
    // Return cached data if available
    if (_cachedPoints != null) {
      return _cachedPoints!;
    }

    try {
      // Load JSON file from assets
      final String jsonString = await rootBundle.loadString(
        'assets/data/points_of_interest.json',
      );

      // Parse JSON
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> pointsList = jsonData['points_of_interest'] as List;

      // Convert to POI objects
      _cachedPoints = pointsList
          .map((json) => PointOfInterest.fromJson(json as Map<String, dynamic>))
          .toList();

      return _cachedPoints!;
    } catch (e) {
      throw Exception('Erro ao carregar pontos de interesse: $e');
    }
  }

  /// Get points by category
  static Future<List<PointOfInterest>> getPointsByCategory(
    Category category,
  ) async {
    final allPoints = await loadPointsOfInterest();
    return allPoints.where((poi) => poi.category == category).toList();
  }

  /// Get point by ID
  static Future<PointOfInterest?> getPointById(String id) async {
    final allPoints = await loadPointsOfInterest();
    try {
      return allPoints.firstWhere((poi) => poi.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Get points by multiple IDs (for favorites)
  static Future<List<PointOfInterest>> getPointsByIds(
    List<String> ids,
  ) async {
    final allPoints = await loadPointsOfInterest();
    return allPoints.where((poi) => ids.contains(poi.id)).toList();
  }

  /// Clear cache (useful for testing or refresh)
  static void clearCache() {
    _cachedPoints = null;
  }
}

