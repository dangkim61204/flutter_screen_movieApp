import 'package:flutter/material.dart';
import '../models/movie.dart';
import 'watch_screen.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Poster và thông tin chia 2 cột
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Poster
                Column(
                  children: [
                    Image.asset(
                      movie.imageUrl ?? 'assets/images/lieu_chu_ky.jpg',
                      height: 200,
                      width: 150,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 200,
                        width: 150,
                        color: Colors.grey[300],
                        child: const Center(child: Text('Lỗi tải ảnh')),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WatchScreen(movie: movie),
                          ),
                        );
                      },
                      child: const Text('Xem phim'),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                // Thông tin phim
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tên phim: ${movie.title}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text('Thể loại: ${movie.genre}'),
                      Text('Số tập: ${movie.episodes}'),
                      Text('Thời lượng: ${movie.duration}'),
                      Text('Trạng thái: ${movie.status}'),
                      Text('Diễn viên: ${movie.actors}'),
                      Text('Điểm đánh giá: ${movie.rating}'),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Nội dung phim nổi bật
            Text(
              'Nội dung phim',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
            const SizedBox(height: 8),
            Text(
              movie.content,
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 24),

            // Phần bình luận
            Text(
              'Bình luận',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey),
            ),
            const SizedBox(height: 8),
            // Chỗ nhập bình luận
            TextField(
              decoration: InputDecoration(
                hintText: 'Viết bình luận...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Xử lý gửi bình luận
                },
                child: const Text('Gửi'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
