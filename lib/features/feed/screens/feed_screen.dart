import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants/api_endpoints.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/left_drawer.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key, this.client});

  final http.Client? client;

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late final http.Client _client;
  late final bool _ownsClient;
  late Future<List<FeedPost>> _posts;

  @override
  void initState() {
    super.initState();
    _ownsClient = widget.client == null;
    _client = widget.client ?? http.Client();
    _posts = _fetchPosts();
  }

  @override
  void dispose() {
    if (_ownsClient) {
      _client.close();
    }
    super.dispose();
  }

  Future<List<FeedPost>> _fetchPosts() async {
    final postsUri = Uri.parse('${ApiEndpoints.baseUrl}/api/v1/posts');
    final response = await _client.get(postsUri);
    if (response.statusCode == 401) {
      throw const FeedAuthenticationRequired();
    }
    if (response.statusCode != 200) {
      throw FeedRequestFailed(response.statusCode);
    }

    final payload = jsonDecode(response.body) as Map<String, dynamic>;
    final data = payload['data'] as List<dynamic>;
    return data
        .map((post) => FeedPost.fromJson(post as Map<String, dynamic>))
        .toList();
  }

  void _reload() {
    setState(() {
      _posts = _fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Feed'),
        actions: [
          IconButton(
            tooltip: 'Muat ulang',
            onPressed: _reload,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder<List<FeedPost>>(
        future: _posts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return _FeedError(error: snapshot.error!, onRetry: _reload);
          }

          final posts = snapshot.data ?? const <FeedPost>[];
          if (posts.isEmpty) {
            return const Center(child: Text('Belum ada postingan.'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: posts.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) => _PostCard(post: posts[index]),
          );
        },
      ),
    );
  }
}

class FeedPost {
  const FeedPost({
    required this.author,
    required this.content,
    required this.likeCount,
    required this.commentCount,
    required this.createdAt,
    this.imageUrl,
  });

  factory FeedPost.fromJson(Map<String, dynamic> json) {
    final author = Map<String, dynamic>.from(json['author'] as Map);
    return FeedPost(
      author: author['name'] as String? ?? 'Pengguna',
      content: json['content'] as String? ?? '',
      likeCount: json['like_count'] as int? ?? 0,
      commentCount: json['comment_count'] as int? ?? 0,
      createdAt: DateTime.tryParse(json['created_at'] as String? ?? ''),
      imageUrl: json['image_url'] as String?,
    );
  }

  final String author;
  final String content;
  final int likeCount;
  final int commentCount;
  final DateTime? createdAt;
  final String? imageUrl;
}

class _PostCard extends StatelessWidget {
  const _PostCard({required this.post});

  final FeedPost post;

  @override
  Widget build(BuildContext context) {
    final date = post.createdAt;
    final dateText = date == null
        ? ''
        : '${date.day}/${date.month}/${date.year}';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: AppColors.primary200,
                  child: Icon(Icons.person, color: AppColors.secondary700),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.author,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      if (dateText.isNotEmpty)
                        Text(
                          dateText,
                          style: const TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 12,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(post.content),
            if (post.imageUrl != null) ...[
              const SizedBox(height: 12),
              Image.network(
                post.imageUrl!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const SizedBox.shrink(),
              ),
            ],
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.favorite_border, size: 18),
                const SizedBox(width: 4),
                Text('${post.likeCount}'),
                const SizedBox(width: 16),
                const Icon(Icons.chat_bubble_outline, size: 18),
                const SizedBox(width: 4),
                Text('${post.commentCount}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FeedError extends StatelessWidget {
  const _FeedError({required this.error, required this.onRetry});

  final Object error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final message = switch (error) {
      FeedAuthenticationRequired() => 'Silakan login untuk melihat Feed. Endpoint Feed membutuhkan sesi akun.',
      FeedRequestFailed(:final statusCode) =>
        'Feed gagal dimuat (HTTP $statusCode).',
      _ => 'Feed gagal dimuat: $error',
    };

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.cloud_off_outlined, size: 40),
            const SizedBox(height: 12),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Coba lagi'),
            ),
          ],
        ),
      ),
    );
  }
}

class FeedAuthenticationRequired implements Exception {
  const FeedAuthenticationRequired();
}

class FeedRequestFailed implements Exception {
  const FeedRequestFailed(this.statusCode);

  final int statusCode;
}
