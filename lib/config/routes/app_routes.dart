import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/features/home/presentation/pages/home_screen.dart';
import 'package:movie_recommendation_app/features/home/presentation/pages/splash_screen.dart';
import 'package:movie_recommendation_app/features/search/domain/usecases/search_movies_usecase.dart';
import 'package:movie_recommendation_app/features/search/data/repositories/movie_repository.dart';
import 'package:movie_recommendation_app/features/search/presentation/pages/search_screen.dart';
import 'package:movie_recommendation_app/features/watchlist/presentation/pages/watch_list_screen.dart';

Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const SplashScreen(),
  '/home': (context) => const HomeScreen(),
  '/watchlist': (context) => const WatchListScreen(),

  '/search': (context) {
    final repo = MockMovieRepository(); // Replace with real repo later
    final useCase = SearchMoviesUseCase(repo);
    return SearchScreen(searchMoviesUseCase: useCase);
  },
};
