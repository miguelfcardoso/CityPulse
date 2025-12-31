import 'package:flutter/material.dart';
import '../models/category.dart';

/// Premium widget to display a category card
class CategoryCard extends StatefulWidget {
  final Category category;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool _isPressed = false;

  Color _getCategoryColor() {
    switch (widget.category) {
      case Category.monuments:
        return const Color(0xFF6366F1); // Indigo
      case Category.museums:
        return const Color(0xFF8B5CF6); // Purple
      case Category.gastronomy:
        return const Color(0xFFEC4899); // Pink
      case Category.parks:
        return const Color(0xFF10B981); // Green
      case Category.culture:
        return const Color(0xFFF59E0B); // Amber
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoryColor = _getCategoryColor();

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                categoryColor.withValues(alpha: 0.9),
                categoryColor,
              ],
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: categoryColor.withValues(alpha: 0.4),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.onTap,
              borderRadius: BorderRadius.circular(24),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon with background
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        widget.category.icon,
                        style: const TextStyle(fontSize: 40),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Category name
                    Text(
                      widget.category.displayName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

