import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/core/constants/theme.dart';
import 'package:movie_recommendation_app/routes/app_routes.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Recommendation App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      routes: appRoutes,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}