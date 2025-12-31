import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/point_of_interest.dart';

/// Premium card widget for displaying a point of interest
class PointCard extends StatelessWidget {
  final PointOfInterest point;
  final VoidCallback onTap;
  final Widget? trailing;

  const PointCard({
    super.key,
    required this.point,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final surfaceColor = isDark ? const Color(0xFF1E293B) : Colors.white;
    final textPrimary = isDark ? const Color(0xFFF8FAFC) : const Color(0xFF1E293B);
    final textSecondary = isDark ? const Color(0xFF94A3B8) : Colors.grey[600]!;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image with gradient overlay
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 10,
                    child: _buildImage(),
                  ),
                  // Gradient overlay for better text readability
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.3),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Favorite button overlay
                  if (trailing != null)
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        decoration: BoxDecoration(
                          color: surfaceColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.15),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: trailing!,
                      ),
                    ),
                ],
              ),

              // Content with premium spacing and typography
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      point.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: textPrimary,
                        letterSpacing: -0.5,
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 8),

                    // Short description
                    Text(
                      point.shortDescription,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: textSecondary,
                        height: 1.5,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 12),

                    // Location with icon
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF6366F1).withValues(alpha: isDark ? 0.2 : 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.location_on_rounded,
                            size: 16,
                            color: isDark ? const Color(0xFF818CF8) : const Color(0xFF6366F1),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            point.location,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: textSecondary,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    // Check if image is a local asset or network URL
    if (point.image.startsWith('assets/')) {
      // Local asset image
      return Image.asset(
        point.image,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.grey[200],
          child: Center(
            child: Icon(
              Icons.image_not_supported_rounded,
              size: 48,
              color: Colors.grey[400],
            ),
          ),
        ),
      );
    } else {
      // Network image
      return CachedNetworkImage(
        imageUrl: point.image,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: Colors.grey[200],
          child: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.grey[200],
          child: Center(
            child: Icon(
              Icons.image_not_supported_rounded,
              size: 48,
              color: Colors.grey[400],
            ),
          ),
        ),
      );
    }
  }
}

