import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
 
  const BottomNav({super.key, required this.currentIndex,});

  void _navigateTo(BuildContext context, int index) {
  switch (index){
    case 0:
      Navigator.pushNamed(context, '/home');
      break;
    case 1:
      Navigator.pushNamed(context, '/search');
      break;
    case 2:
      Navigator.pushNamed(context, '/watchlist');
      break;
    default:
      Navigator.pushNamed(context, '/home');
      break;
  }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _navigateTo(context, index),
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(HugeIcons.strokeRoundedHome07),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(HugeIcons.strokeRoundedSearch01),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(HugeIcons.strokeRoundedBookmark02),
          label: 'Watch list',
        ),
      ],
    );
  }
}
