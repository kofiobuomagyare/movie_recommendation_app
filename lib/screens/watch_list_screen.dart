import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/nav/bottom_nav.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text('Watch List Page')),
      ),
       bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         Divider(height: 1, thickness: 1, color: Theme.of(context).colorScheme.primary),
          BottomNav(currentIndex: 2)
                  ],
      ),
    );
  }
}