/// Tourist category enum
enum Category {
  monuments,
  museums,
  gastronomy,
  parks,
  culture;

  String get displayName {
    switch (this) {
      case Category.monuments:
        return 'Monumentos';
      case Category.museums:
        return 'Museus';
      case Category.gastronomy:
        return 'Gastronomia';
      case Category.parks:
        return 'Parques';
      case Category.culture:
        return 'Cultura';
    }
  }

  String get icon {
    switch (this) {
      case Category.monuments:
        return '🏛️';
      case Category.museums:
        return '🏛️';
      case Category.gastronomy:
        return '🍽️';
      case Category.parks:
        return '🌳';
      case Category.culture:
        return '🎭';
    }
  }

  static Category fromString(String value) {
    return Category.values.firstWhere(
      (cat) => cat.name.toLowerCase() == value.toLowerCase(),
      orElse: () => Category.culture,
    );
  }
}

