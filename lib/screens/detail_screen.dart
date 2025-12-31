import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/point_of_interest.dart';
import '../services/json_data_service.dart';
import '../services/favorites_service.dart';

/// Detail screen for a specific point of interest
class DetailScreen extends StatefulWidget {
  final String pointId;

  const DetailScreen({
    super.key,
    required this.pointId,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  PointOfInterest? _point;
  bool _isFavorite = false;
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
      final point = await JsonDataService.getPointById(widget.pointId);
      final isFavorite = await FavoritesService.isFavorite(widget.pointId);

      setState(() {
        _point = point;
        _isFavorite = isFavorite;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Erro ao carregar detalhes';
        _isLoading = false;
      });
    }
  }

  Future<void> _toggleFavorite() async {
    try {
      final isFavorite = await FavoritesService.toggleFavorite(widget.pointId);
      setState(() {
        _isFavorite = isFavorite;
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
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: _point != null
          ? FloatingActionButton.extended(
              onPressed: _toggleFavorite,
              icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border),
              label: Text(_isFavorite ? 'Remover' : 'Adicionar'),
              backgroundColor: _isFavorite ? Colors.red : Theme.of(context).primaryColor,
            )
          : null,
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null || _point == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 64, color: Colors.grey[400]),
              const SizedBox(height: 16),
              Text(
                _errorMessage ?? 'Ponto não encontrado',
                style: TextStyle(color: Colors.grey[600]),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _loadData,
                icon: const Icon(Icons.refresh),
                label: const Text('Tentar Novamente'),
              ),
            ],
          ),
        ),
      );
    }

    final point = _point!;

    return OrientationBuilder(
      builder: (context, orientation) {
        return CustomScrollView(
          slivers: [
            // App bar with image
            SliverAppBar(
              expandedHeight: orientation == Orientation.portrait ? 300 : 200,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  point.name,
                  style: const TextStyle(
                    shadows: [
                      Shadow(
                        offset: Offset(0, 1),
                        blurRadius: 3,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                background: _buildBackground(point.image),
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),

            // Content
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Description
                    Text(
                      'Descrição',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      point.description,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 24),

                    // Information cards
                    _buildInfoCard(
                      context,
                      icon: Icons.access_time,
                      title: 'Horário',
                      content: point.schedule,
                    ),
                    const SizedBox(height: 12),
                    _buildInfoCard(
                      context,
                      icon: Icons.euro,
                      title: 'Preço Médio',
                      content: point.averagePrice,
                    ),
                    const SizedBox(height: 12),
                    _buildInfoCard(
                      context,
                      icon: Icons.location_on,
                      title: 'Localização',
                      content: point.location,
                    ),
                    const SizedBox(height: 12),
                    _buildInfoCard(
                      context,
                      icon: Icons.category,
                      title: 'Categoria',
                      content: point.category.displayName,
                    ),

                    // Bottom spacing for FAB
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInfoCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Theme.of(context).primaryColor),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    content,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackground(String imagePath) {
    // Check if image is a local asset or network URL
    if (imagePath.startsWith('assets/')) {
      // Local asset image
      return Image.asset(
        imagePath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.grey[300],
          child: const Icon(Icons.image_not_supported, size: 64),
        ),
      );
    } else {
      // Network image
      return CachedNetworkImage(
        imageUrl: imagePath,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: Colors.grey[300],
          child: const Center(child: CircularProgressIndicator()),
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.grey[300],
          child: const Icon(Icons.image_not_supported, size: 64),
        ),
      );
    }
  }
}

