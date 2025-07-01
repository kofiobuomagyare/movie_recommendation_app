import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_recommendation_app/features/home/presentation/widgets/bottom_nav.dart';
import 'package:movie_recommendation_app/features/search/domain/entities/movie_entity.dart';
import 'package:movie_recommendation_app/features/search/domain/usecases/search_movies_usecase.dart';

class SearchScreen extends StatefulWidget {
  final SearchMoviesUseCase searchMoviesUseCase;

  const SearchScreen({super.key, required this.searchMoviesUseCase});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<MovieEntity> _filteredMovies = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.trim();
    if (query.isEmpty) {
      setState(() {
        _filteredMovies = [];
      });
      return;
    }

    final results = widget.searchMoviesUseCase.call(query);
    setState(() {
      _filteredMovies = results;
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: _buildSearchAppBar(context),
      body: _buildBody(isDarkMode),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            height: 1,
            thickness: 1,
            color: Theme.of(context).colorScheme.primary,
          ),
          BottomNav(currentIndex: 1),
        ],
      ),
    );
  }

  AppBar _buildSearchAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).colorScheme.onPrimary,
          size: 20,
        ),
        onPressed: () => context.pop(),
      ),
      title: Text(
        'Search',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(
            Icons.info_outline,
            color: Theme.of(context).colorScheme.onPrimary,
            size: 24,
          ),
          onPressed: () => context.pop,
        ),
      ],
    );
  }

  Widget _buildBody(bool isDarkMode) {
    final query = _searchController.text.trim();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildSearchInput(context),
          const SizedBox(height: 24),
          Expanded(
            child:
                query.isEmpty
                    ? const SizedBox() 
                    : _filteredMovies.isEmpty
                    ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/search_error.png',
                            width: 76,
                            height: 76,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'We Are Sorry, We Can Not Find The Movie :(',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Find your movie by Type title,\ncategories, years, etc',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(
                                context,
                              ).colorScheme.onPrimary.withOpacity(0.5),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                    : ListView.builder(
                      itemCount: _filteredMovies.length,
                      itemBuilder: (context, index) {
                        final movie = _filteredMovies[index];
                        return _buildMovieCard(context, movie, isDarkMode);
                      },
                    ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchInput(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.09),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: _searchController,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: 'Search for movies, series, or actors',
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.4),
            fontSize: 16,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.4),
              size: 20,
            ),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
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
              child:
                  movie.imagePath != null
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
                    color: Theme.of(context).colorScheme.onPrimary,
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
                        CupertinoIcons.ticket,
                        size: 12,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        movie.genre!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onPrimary,
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
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        movie.duration!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                if (movie.restriction != null)
                  Row(
                    children: [
                      const Icon(Icons.warning, size: 12, color: Colors.red),
                      const SizedBox(width: 4),
                      Text(
                        movie.restriction!,
                        style: const TextStyle(fontSize: 12, color: Colors.red),
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
