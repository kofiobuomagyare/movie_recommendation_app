import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/core/constants/colors.dart';

class MovieImageButton extends StatelessWidget {
  final String imagePath;
  final int number;
  final VoidCallback onTap;

  const MovieImageButton({
    super.key,
    required this.imagePath,
    required this.number,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 210,
        width: 139.58,
        child: Stack(
          children: [
            // Movie poster image
            Positioned(
              left: 20, // Offset to make room for the number
              top: 40,
              bottom: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Ranking number with stroke effect
            Positioned(
              left: 0,
              bottom: 0,
              child: Stack(
                children: [
                  // Stroke/outline effect
                  Text(
                    '$number',
                    style: TextStyle(
                      fontSize: 96,
                      fontWeight: FontWeight.w600,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 1
                        ..color = AppColors.blueAccent,
                    ),
                  ),
                  // Main text
                  Text(
                    '$number',
                    style: TextStyle(
                      fontSize: 96,
                      fontWeight: FontWeight.w600,
                      color:Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
