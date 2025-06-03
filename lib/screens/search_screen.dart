import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/nav/bottom_nav.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<RecentSearches> _recentSearches = [
    RecentSearches(
      title: 'Spiderman',
      rating: '9.5',
      releaseYear: '2019',
      genre: 'Action',
      imagePath: 'assets/images/Rectangle_4.png',
      duration: '139 minutes',
    ),
    RecentSearches(
      title: 'Spider-Man: No Way Home',
      releaseYear: '2021',
      rating: '8.5',
      imagePath: 'assets/images/Rectangle_5.png',
      guidance: 'PG G',
      restriction: 'Restricted',
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: _buildSearchAppBar(context, isDarkMode),
      body: _buildBody(isDarkMode),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         Divider(height: 1, thickness: 1, color: Theme.of(context).colorScheme.primary),
          BottomNav(currentIndex: 1)
                  ],
      ),
    );
  }

  AppBar _buildSearchAppBar(BuildContext context, bool isDarkMode) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).colorScheme.onPrimary,
          size: 20,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
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
            color:Theme.of(context).colorScheme.onPrimary,
            size: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget _buildBody(bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search TextField
          Container(
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
                suffixIcon: Container(
                  margin: const EdgeInsets.all(8),
                  child: Icon(
                    Icons.search,
                    color:Theme.of(context).colorScheme.onPrimary.withOpacity(0.4),
                    size: 20,
                  ),
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
            ),
          ),
          const SizedBox(height: 24),
          
          // Movie List
          Expanded(
            child: ListView.builder(
              itemCount: _recentSearches.length,
              itemBuilder: (context, index) {
                final search = _recentSearches[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Movie Poster
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: 95,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: search.imagePath != null
                              ? Image.asset(
                                  search.imagePath!,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color:Theme.of(context).scaffoldBackgroundColor,
                                      child: const Icon(Icons.movie, color: Colors.grey),
                                    );
                                  },
                                )
                              : const Icon(Icons.movie, color: Colors.grey),
                        ),
                      ),
                      const SizedBox(width: 12),
                      
                      // Movie Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title
                            Text(
                              search.title ?? '',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color:Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            
                            // Rating
                            if (search.rating != null)
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_border,
                                    color:Theme.of(context).colorScheme.secondary,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    search.rating!,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.orange,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),


                            // Guidance (if available)
                               if (search.guidance != null) ...[
                              Row(
                                children: [
                                  Text(
                                    search.guidance!,
                                    style:  TextStyle(
                                      fontSize: 12,
                                      color:Theme.of(context).colorScheme.onPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            
                            // Genre (if available)
                            if (search.genre != null) ...[
                            
                              Row(
                                children: [
                                  Icon(
                                   CupertinoIcons.ticket,
                                    size: 12,
                                    color:Theme.of(context).colorScheme.onPrimary,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    search.genre!,
                                    style:  TextStyle(
                                      fontSize: 12,
                                      color:Theme.of(context).colorScheme.onPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                           
                            
                            // Year and Duration
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 12,
                                  color: isDarkMode ? Colors.white54 : Colors.black45,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  search.releaseYear ?? '',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isDarkMode ? Colors.white54 : Colors.black45,
                                  ),
                                ),
                              ],
                            ),
                            
                            // Duration
                             if (search.duration != null) ...[
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    size: 12,
                                    color:Theme.of(context).colorScheme.onPrimary,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    search.duration!,
                                    style:  TextStyle(
                                      fontSize: 12,
                                      color:Theme.of(context).colorScheme.onPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            // Restriction (if available)
                            if (search.restriction != null) ...[
                             
                              Row(
                                children: [
                                  Icon(
                                    Icons.warning,
                                    size: 12,
                                    color: Colors.red,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    search.restriction!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RecentSearches {
  final String? imagePath;
  final String? title;
  final String? releaseYear;
  final String? genre;
  final String? duration;
  final String? rating;
  final String? guidance;
  final String? restriction;

  RecentSearches({
    this.imagePath,
    this.title,
    this.releaseYear,
    this.genre,
    this.duration,
    this.rating,
    this.guidance,
    this.restriction,
  });
}