import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/nav/bottom_nav.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text('Search Page')),
      ),
      bottomNavigationBar: BottomNav(
        currentIndex:1,
      ),
    );
  }
}