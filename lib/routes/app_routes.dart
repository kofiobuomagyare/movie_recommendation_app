import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/screens/home_screen.dart';
import 'package:movie_recommendation_app/screens/search_screen.dart';
import 'package:movie_recommendation_app/screens/watch_list_screen.dart';

Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const HomeScreen(),
  '/home': (context) => const HomeScreen(),
  '/search': (context) => const SearchScreen(),
  '/watchlist': (context) => const WatchListScreen(),
  
};