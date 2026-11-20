
class Article {
  final int id;
  final String title;
  final String slug;
  final String summary;
  final String category;
  final List<String> tags;
  final String authorName;
  final String? imageUrl;
  final String? publishedAt;

  Article({
    required this.id,
    required this.title,
    required this.slug,
    required this.summary,
    required this.category,
    required this.tags,
    required this.authorName,
    this.imageUrl,
    this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'] ?? '',
      slug: json['slug'] ?? '',
      summary: json['summary'] ?? '',
      category: json['category']?['name'] ?? '',
      tags: (json['tags'] as List<dynamic>? ?? [])
          .map((tag) => tag['name'].toString())
          .toList(),
      authorName: json['author_name'] ?? '',
      imageUrl: json['image_url'],
      publishedAt: json['published_at'],
    );
  }
}
