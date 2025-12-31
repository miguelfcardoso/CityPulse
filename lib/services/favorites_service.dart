import 'package:shared_preferences/shared_preferences.dart';

/// Service to manage favorites persistence using SharedPreferences
class FavoritesService {
  static const String _favoritesKey = 'favorites';

  /// Get all favorite IDs
  static Future<List<String>> getFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getStringList(_favoritesKey) ?? [];
    } catch (e) {
      throw Exception('Erro ao carregar favoritos: $e');
    }
  }

  /// Check if a point is favorite
  static Future<bool> isFavorite(String id) async {
    final favorites = await getFavorites();
    return favorites.contains(id);
  }

  /// Add a point to favorites
  static Future<void> addFavorite(String id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favorites = await getFavorites();

      if (!favorites.contains(id)) {
        favorites.add(id);
        await prefs.setStringList(_favoritesKey, favorites);
      }
    } catch (e) {
      throw Exception('Erro ao adicionar favorito: $e');
    }
  }

  /// Remove a point from favorites
  static Future<void> removeFavorite(String id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favorites = await getFavorites();

      favorites.remove(id);
      await prefs.setStringList(_favoritesKey, favorites);
    } catch (e) {
      throw Exception('Erro ao remover favorito: $e');
    }
  }

  /// Toggle favorite status
  static Future<bool> toggleFavorite(String id) async {
    final isCurrentlyFavorite = await isFavorite(id);

    if (isCurrentlyFavorite) {
      await removeFavorite(id);
      return false;
    } else {
      await addFavorite(id);
      return true;
    }
  }

  /// Clear all favorites
  static Future<void> clearAllFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_favoritesKey);
    } catch (e) {
      throw Exception('Erro ao limpar favoritos: $e');
    }
  }
}

