import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/point_of_interest.dart';
import '../services/json_data_service.dart';
import '../services/favorites_service.dart';
import '../widgets/point_card.dart';
import 'detail_screen.dart';

/// Screen displaying points of interest for a specific category
class PointsListScreen extends StatefulWidget {
  final Category category;

  const PointsListScreen({
    super.key,
    required this.category,
  });

  @override
  State<PointsListScreen> createState() => _PointsListScreenState();
}

class _PointsListScreenState extends State<PointsListScreen> {
  List<PointOfInterest> _points = [];
  Set<String> _favoriteIds = {};
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final points = await JsonDataService.getPointsByCategory(widget.category);
      final favorites = await FavoritesService.getFavorites();

      setState(() {
        _points = points;
        _favoriteIds = favorites.toSet();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Erro ao carregar pontos de interesse';
        _isLoading = false;
      });
    }
  }

  Future<void> _toggleFavorite(String id) async {
    try {
      final isFavorite = await FavoritesService.toggleFavorite(id);
      setState(() {
        if (isFavorite) {
          _favoriteIds.add(id);
        } else {
          _favoriteIds.remove(id);
        }
      });

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isFavorite
                ? 'Adicionado aos favoritos'
                : 'Removido dos favoritos',
          ),
          duration: const Duration(seconds: 1),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro ao atualizar favoritos'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC);
    final surfaceColor = isDark ? const Color(0xFF1E293B) : Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(widget.category.displayName),
        backgroundColor: surfaceColor,
        elevation: 0,
        shadowColor: Colors.black.withValues(alpha: 0.05),
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          strokeWidth: 3,
        ),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.red.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.error_outline_rounded,
                  size: 64,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                _errorMessage!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF64748B),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _loadData,
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Tentar Novamente'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (_points.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF6366F1).withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.location_off_rounded,
                size: 64,
                color: Color(0xFF6366F1),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Nenhum ponto encontrado',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Não há pontos de interesse nesta categoria',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    return CustomScrollView(
      slivers: [
        // Header with count
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
            child: Row(
              children: [
                Text(
                  '${_points.length} ${_points.length == 1 ? 'local' : 'locais'}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Points list
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final point = _points[index];
                final isFavorite = _favoriteIds.contains(point.id);

                return PointCard(
                  point: point,
                  onTap: () async {
                    await Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            DetailScreen(pointId: point.id),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        transitionDuration: const Duration(milliseconds: 300),
                      ),
                    );
                    // Refresh favorites after returning from detail screen
                    _loadData();
                  },
                  trailing: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite_rounded : Icons.favorite_outline_rounded,
                      color: isFavorite ? Colors.red : Colors.grey[400],
                    ),
                    onPressed: () => _toggleFavorite(point.id),
                  ),
                );
              },
              childCount: _points.length,
            ),
          ),
        ),
      ],
    );
  }
}

