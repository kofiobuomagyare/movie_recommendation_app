import 'package:flutter/material.dart';

class AboutMovieTab extends StatelessWidget {
  final String description;

  const AboutMovieTab({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(description),
    );
  }
}
