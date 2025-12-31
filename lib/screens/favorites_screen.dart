import 'package:flutter/material.dart';
import '../models/point_of_interest.dart';
import '../services/json_data_service.dart';
import '../services/favorites_service.dart';
import '../widgets/point_card.dart';
import 'detail_screen.dart';

/// Screen displaying favorite points of interest
class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<PointOfInterest> _favoritePoints = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final favoriteIds = await FavoritesService.getFavorites();
      final points = await JsonDataService.getPointsByIds(favoriteIds);

      setState(() {
        _favoritePoints = points;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Erro ao carregar favoritos';
        _isLoading = false;
      });
    }
  }

  Future<void> _removeFavorite(String id) async {
    try {
      await FavoritesService.removeFavorite(id);
      await _loadFavorites(); // Reload the list

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Removido dos favoritos'),
          duration: Duration(seconds: 1),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro ao remover favorito'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              _errorMessage!,
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _loadFavorites,
              icon: const Icon(Icons.refresh),
              label: const Text('Tentar Novamente'),
            ),
          ],
        ),
      );
    }

    if (_favoritePoints.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'Nenhum favorito adicionado',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Explore os pontos de interesse\ne adicione seus favoritos',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[500]),
            ),
          ],
        ),
      );
    }

    return OrientationBuilder(
      builder: (context, orientation) {
        return RefreshIndicator(
          onRefresh: _loadFavorites,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: _favoritePoints.length,
            itemBuilder: (context, index) {
              final point = _favoritePoints[index];

              return PointCard(
                point: point,
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(pointId: point.id),
                    ),
                  );
                  // Reload favorites after returning
                  _loadFavorites();
                },
                trailing: IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  onPressed: () => _removeFavorite(point.id),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

