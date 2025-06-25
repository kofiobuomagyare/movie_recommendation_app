class MovieEntity {
  final String title;
  final String? imagePath;
  final String? releaseYear;
  final String? genre;
  final String? duration;
  final String? rating;
  final String? guidance;
  final String? restriction;

  MovieEntity({
    required this.title,
    this.imagePath,
    this.releaseYear,
    this.genre,
    this.duration,
    this.rating,
    this.guidance,
    this.restriction,
  });
}
