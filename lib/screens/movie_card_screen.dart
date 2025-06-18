import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../screens/movie_detail_screen.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final double imageHeight;
  final double imageWidth;

  const MovieCard({
    super.key,
    required this.movie,
    this.imageHeight = 150,
    this.imageWidth = 120,
  });

  @override
  Widget build(BuildContext context) {
    final bool isNetworkImage = movie.imageUrl.startsWith('http');

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => MovieDetailScreen(movie: movie)),
        );
      },
      child: SizedBox(
        width: imageWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: isNetworkImage
                  ? Image.network(
                movie.imageUrl,
                height: imageHeight,
                width: imageWidth,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => _placeholder(),
              )
                  : Image.asset(
                movie.imageUrl,
                height: imageHeight,
                width: imageWidth,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => _placeholder(),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              movie.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _placeholder() {
    return Container(
      height: imageHeight,
      width: imageWidth,
      color: Colors.grey[300],
      child: const Center(child: Text('No Image')),
    );
  }

}
