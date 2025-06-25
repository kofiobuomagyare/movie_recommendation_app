import '../entities/movie_entity.dart';

abstract class MovieRepository {
  List<MovieEntity> searchMovies(String query);
}
