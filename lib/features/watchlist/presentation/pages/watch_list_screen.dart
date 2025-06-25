import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/features/home/presentation/widgets/bottom_nav.dart';
import 'package:movie_recommendation_app/features/search/domain/entities/movie_entity.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  List<MovieEntity> _watchList = []; 
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Watch List',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.onSurface,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _watchList.isEmpty
              ? _buildEmptyState(context)
              : ListView.builder(
                  itemCount: _watchList.length,
                  itemBuilder: (context, index) {
                    final movie = _watchList[index];
                    return _buildMovieCard(context, movie, isDarkMode);
                  },
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
          BottomNav(currentIndex: 2),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/watchlist_error.png', // Use a more appropriate image if needed
            width: 76,
            height: 76,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 24),
          Text(
            'There Is No Movie Yet!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Find your movie by Type title, categories, years, etc ',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color:
                  Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMovieCard(
    BuildContext context,
    MovieEntity movie,
    bool isDarkMode,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Movie image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 95,
              height: 120,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: movie.imagePath != null
                  ? Image.asset(
                      movie.imagePath!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.movie, color: Colors.grey);
                      },
                    )
                  : const Icon(Icons.movie, color: Colors.grey),
            ),
          ),
          const SizedBox(width: 12),

          // Movie details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                if (movie.rating != null)
                  Row(
                    children: [
                      const Icon(
                        Icons.star_border,
                        size: 16,
                        color: Colors.orange,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        movie.rating!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                if (movie.genre != null)
                  Row(
                    children: [
                      Icon(
                        Icons.local_movies,
                        size: 12,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        movie.genre!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                if (movie.releaseYear != null)
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 12,
                        color: isDarkMode ? Colors.white54 : Colors.black45,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        movie.releaseYear!,
                        style: TextStyle(
                          fontSize: 12,
                          color: isDarkMode ? Colors.white54 : Colors.black45,
                        ),
                      ),
                    ],
                  ),
                if (movie.duration != null)
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 12,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        movie.duration!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
