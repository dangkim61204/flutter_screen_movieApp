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
              child: Image.network(
                'http://10.0.2.2:8000/${movie.imageUrl}', // Tự nối full path ảnh
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
