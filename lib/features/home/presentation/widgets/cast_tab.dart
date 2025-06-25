import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/features/home/domain/entities/movie.dart';

class CastTab extends StatelessWidget {
  final List<CastMember> cast;

  const CastTab({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: cast.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 140,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        final actor = cast[index];
        return Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(actor.imagePath),
              radius: 40,
            ),
            const SizedBox(height: 8),
            Text(actor.name, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        );
      },
    );
  }
}
