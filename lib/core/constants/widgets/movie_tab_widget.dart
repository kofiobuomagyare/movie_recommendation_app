import 'package:flutter/material.dart';

class MovieTabWidget extends StatelessWidget {
  const MovieTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Material(
            elevation: 0,
            color:Theme.of(context).scaffoldBackgroundColor,
            child: Container(
              decoration:  BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    width: 2,
                  ),
                ),
              ),
              child: TabBar(
                isScrollable: true,
                indicatorColor: Theme.of(context).colorScheme.primary,
                labelColor: Theme.of(context).colorScheme.onPrimary,
                unselectedLabelColor:
                    Theme.of(context).colorScheme.onPrimary.withOpacity(0.4),
                tabs: const [
                  Tab(text: 'Now Playing'),
                  Tab(text: 'Upcoming'),
                  Tab(text: 'Top Rated'),
                  Tab(text: 'Popular'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: TabBarView(
              children: [
                _buildNowPlayingTab(),
                Center(child: Text('Upcoming Movies')),
                Center(child: Text('Top Rated Movies')),
                Center(child: Text('Popular Movies')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildNowPlayingTab() {
  final imagePath = [
    'assets/images/Movie.png',
    'assets/images/Movie(1).png',
    'assets/images/Movie(2).png',
    'assets/images/Movie(5).png',
    'assets/images/Movie(4).png',
    'assets/images/Movie(3).png',
  ];
  return GridView.count(
    crossAxisCount: 3,
    childAspectRatio: 0.6,
    padding: const EdgeInsets.all(8.0),
    children: List.generate(6, (index) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Image.asset(imagePath[index], fit: BoxFit.cover),
      );
    }),
  );
}
