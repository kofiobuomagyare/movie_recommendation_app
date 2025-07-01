import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
 
  const BottomNav({super.key, required this.currentIndex,});

  void _navigateTo(BuildContext context, int index) {
  switch (index){
    case 0:
      context.push('/home');
;
      break;
    case 1:
      context.push( '/search');
      break;
    case 2:
     context.push( '/watchlist');
      break;
    default:
     context.go( '/home');
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
