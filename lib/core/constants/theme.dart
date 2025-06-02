import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/core/constants/colors.dart';

class AppTheme{
  static final  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.blueAccent,
    colorScheme: ColorScheme.dark(
      primary: AppColors.blueAccent,
      secondary: AppColors.orange,
      error: AppColors.red,
      surface: AppColors.background,
      onPrimary: AppColors.white,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: AppColors.white, fontSize: 24, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color:AppColors.blueAccent),
      bodySmall: TextStyle(color: AppColors.white),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
     foregroundColor: AppColors.white,
     elevation: 0,
    ),
    useMaterial3: true,
  );

   static final  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.blueAccent,
    colorScheme: ColorScheme.light(
      primary: AppColors.blueAccent,
      secondary: AppColors.orange,
      error: AppColors.red,
      surface: AppColors.white,
      onPrimary: AppColors.background,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: AppColors.background, fontSize: 24, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color:AppColors.blueAccent),
      bodySmall: TextStyle(color: AppColors.background,),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.background,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
     foregroundColor: AppColors.background,
     elevation: 0,
    ),
    useMaterial3: true,
  );
}