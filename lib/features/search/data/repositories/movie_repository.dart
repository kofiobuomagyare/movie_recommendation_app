import '../../domain/entities/movie_entity.dart';
import '../../domain/repositories/movie_repository.dart';

class MockMovieRepository implements MovieRepository {
  final List<MovieEntity> _allMovies = [
    MovieEntity(
      title: 'Spiderman',
      rating: '9.5',
      releaseYear: '2019',
      genre: 'Action',
      imagePath: 'assets/images/Rectangle_4.png',
      duration: '139 minutes',
    ),
    MovieEntity(
      title: 'Spider-Man: No Way Home',
      releaseYear: '2021',
      rating: '8.5',
      imagePath: 'assets/images/Rectangle_5.png',
      guidance: 'PG G',
      restriction: 'Restricted',
    ),
  ];

  @override
  List<MovieEntity> searchMovies(String query) {
    final lowerQuery = query.toLowerCase();
    return _allMovies.where((movie) {
      return movie.title.toLowerCase().contains(lowerQuery) ||
             (movie.genre ?? '').toLowerCase().contains(lowerQuery) ||
             (movie.releaseYear ?? '').contains(lowerQuery);
    }).toList();
  }
}
