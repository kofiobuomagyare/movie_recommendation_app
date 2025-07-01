import 'package:go_router/go_router.dart';
import 'package:movie_recommendation_app/features/home/data/data_sources/dummy_movies.dart';
import 'package:movie_recommendation_app/features/home/presentation/pages/details_screen.dart';
import 'package:movie_recommendation_app/features/home/presentation/pages/home_screen.dart';
import 'package:movie_recommendation_app/features/home/presentation/pages/splash_screen.dart';
import 'package:movie_recommendation_app/features/search/data/repositories/movie_repository.dart';
import 'package:movie_recommendation_app/features/search/domain/usecases/search_movies_usecase.dart';
import 'package:movie_recommendation_app/features/search/presentation/pages/search_screen.dart';
import 'package:movie_recommendation_app/features/watchlist/presentation/pages/watch_list_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/watchlist',
      builder: (context, state) => const WatchListScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) {
        final repo = MockMovieRepository(); 
        final useCase = SearchMoviesUseCase(repo);
        return SearchScreen(searchMoviesUseCase: useCase);
      },
    ),
    GoRoute(
      path: '/movie/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        final movie = dummyMovies.firstWhere((m) => m.id == id);
        return DetailsScreen(movie: movie);
      },
    ),
  ],
);
