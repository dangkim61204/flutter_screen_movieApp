import 'package:flutter/material.dart';
import '../models/movie.dart';

class WatchScreen extends StatefulWidget {
  final Movie movie;

  const WatchScreen({super.key, required this.movie});

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  int selectedEpisode = 0;

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;

    final trendingMovies = List.generate(
      10,
          (index) => Movie(
        title: 'Trending ${index + 1}',
        genre: 'Hành động',
        episodes: 1,
        duration: '90 phút',
        status: 'Hoàn tất',
        actors: 'Diễn viên A',
        rating: 4.5,
        content: 'Phim trending hấp dẫn',
        imageUrl: 'assets/images/lieu_chu_ky.jpg',
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Xem: ${movie.title}')),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tên phim
              Text(
                '${movie.title} - Tập ${selectedEpisode + 1}',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
              ),
              const SizedBox(height: 16),

              // Giả lập video
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.grey[800],
                child: Center(
                  child: Text(
                    'Đang xem Tập ${selectedEpisode + 1}',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Tập phim header
              Row(
                children: const [
                  Text('TẬP PHIM', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orangeAccent)),
                  SizedBox(width: 16),
                  Text('VIETSUB', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
                ],
              ),
              const Divider(color: Colors.grey, thickness: 1),
              const SizedBox(height: 12),

              // Các tập phim
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: movie.episodes,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (context, index) {
                  final episodeNumber = movie.episodes - index;
                  final isActive = episodeNumber == (selectedEpisode + 1);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedEpisode = episodeNumber - 1;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isActive ? Colors.red : Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 3,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '$episodeNumber',
                        style: TextStyle(
                          color: isActive ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),

              // Phim trending
              Text('Phim đang hot', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orangeAccent)),
              const SizedBox(height: 8),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trendingMovies.length,
                  itemBuilder: (context, index) {
                    final trending = trendingMovies[index];
                    return Container(
                      width: 120,
                      margin: const EdgeInsets.only(right: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            movie.imageUrl ?? 'assets/images/lieu_chu_ky.jpg',
                            height: 120,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              height: 120,
                              color: Colors.grey[700],
                              child: const Center(child: Text('Lỗi tải ảnh')),
                            ),
                          ),
                          // Container(
                          //   height: 120,
                          //   color: Colors.grey[700],
                          //   child: const Center(child: Text('Ảnh', style: TextStyle(color: Colors.white))),
                          // ),
                          const SizedBox(height: 6),
                          Text(
                            trending.title,
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              // Bình luận
              Text('Bình luận', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orangeAccent)),
              const SizedBox(height: 8),
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Nhập bình luận...',
                  hintStyle: const TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: xử lý gửi bình luận
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Gửi'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
