import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/core/constants/buttons/movie_image_button.dart';
import 'package:movie_recommendation_app/core/constants/widgets/movie_tab_widget.dart';
import 'package:movie_recommendation_app/nav/bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imagePaths = [
    'assets/images/Movie.png',
    'assets/images/movie-2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(''),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: SizedBox(
              width: 28,
              height: 28,
              child: IconButton(
                icon: Icon(Icons.settings),
                iconSize: 28.0,
                padding: EdgeInsets.zero,
                tooltip: 'Settings',
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 29.0, right: 16.0),
                    child: Text(
                      'What do you want to watch?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.only(left: 24.0),
                child: SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imagePaths.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: MovieImageButton(
                          imagePath: imagePaths[index],
                          number: index + 1,
                          onTap: () {
                            // Handle tap
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(height: 453, child: MovieTabWidget()),
            ],
          ),
        ),
      ),
      
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         Divider(height: 1, thickness: 1, color: Theme.of(context).colorScheme.primary),
          BottomNav(currentIndex: 0)
                  ],
      ),
    );
  }
}
