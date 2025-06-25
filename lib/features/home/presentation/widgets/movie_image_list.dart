import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/features/home/domain/entities/movie.dart';
import 'package:movie_recommendation_app/features/home/presentation/widgets/cards/movie_image_card.dart';

class MovieImageList extends StatelessWidget {
  final List<Movie> movies;
  final void Function(Movie movie)? onTap;

  const MovieImageList({super.key, required this.movies, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: SizedBox(
        height: 250,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Padding(
                padding: EdgeInsets.only(
                  left:
                      index == 0
                          ? 24.0
                          : 12.0, // Apply padding only to the first item
                  right: 12.0,
                ),
                child: MovieImageCard(
                  imagePath: movie.imagePath,
                  number: index + 1,
                  onTap: () => onTap?.call(movie),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
