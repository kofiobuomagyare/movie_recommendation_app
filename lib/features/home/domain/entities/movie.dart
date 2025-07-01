class Movie {
  final String id;
  final String title;
  final String imagePath;
  final String coverImage;
  final int year;
  final int durationMinutes;
  final String genre;
  final String description;
  final double rating;
  final List<Review> reviews;
  final List<CastMember> cast;

  Movie({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.coverImage,
    required this.year,
    required this.durationMinutes,
    required this.genre,
    required this.description,
    required this.rating,
    this.reviews = const [],
    this.cast = const [],
  });
}

class Review {
  final String reviewerName;
  final String content;
  final double rating;

  Review({
    required this.reviewerName,
    required this.content,
    required this.rating,
  });
}

class CastMember {
  final String name;
  final String imagePath;

  CastMember({
    required this.name,
    required this.imagePath,
  });
}
