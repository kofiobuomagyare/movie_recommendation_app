import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';

class SearchMoviesUseCase {
  final MovieRepository repository;

  SearchMoviesUseCase(this.repository);

  List<MovieEntity> call(String query) {
    return repository.searchMovies(query);
  }
}
