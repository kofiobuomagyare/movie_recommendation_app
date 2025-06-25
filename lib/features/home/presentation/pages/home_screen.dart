import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/features/home/data/data_sources/dummy_movies.dart';
import 'package:movie_recommendation_app/features/home/presentation/pages/details_screen.dart';
import 'package:movie_recommendation_app/features/home/presentation/widgets/movie_image_list.dart';
import 'package:movie_recommendation_app/features/home/presentation/widgets/movie_tab_widget.dart';
import 'package:movie_recommendation_app/features/home/presentation/widgets/bottom_nav.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(''),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 29.0, right: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'What do you want to watch?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              MovieImageList(
                movies: dummyMovies,
                onTap: (movie) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailsScreen(movie: movie),
                    ),
                  );
                },
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
          Divider(
            height: 1,
            thickness: 1,
            color: Theme.of(context).colorScheme.primary,
          ),
          BottomNav(currentIndex: 0),
        ],
      ),
    );
  }
}
