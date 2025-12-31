import 'category.dart';

/// Point of Interest model
class PointOfInterest {
  final String id;
  final String name;
  final String shortDescription;
  final String description;
  final String image;
  final String schedule;
  final String averagePrice;
  final String location;
  final Category category;

  PointOfInterest({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.description,
    required this.image,
    required this.schedule,
    required this.averagePrice,
    required this.location,
    required this.category,
  });

  /// Create from JSON
  factory PointOfInterest.fromJson(Map<String, dynamic> json) {
    return PointOfInterest(
      id: json['id'] as String,
      name: json['name'] as String,
      shortDescription: json['short_description'] as String? ?? '',
      description: json['description'] as String,
      image: json['image'] as String,
      schedule: json['schedule'] as String? ?? 'Horário não disponível',
      averagePrice: json['average_price'] as String? ?? 'Gratuito',
      location: json['location'] as String,
      category: Category.fromString(json['category'] as String? ?? 'culture'),
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'short_description': shortDescription,
      'description': description,
      'image': image,
      'schedule': schedule,
      'average_price': averagePrice,
      'location': location,
      'category': category.name,
    };
  }
}

