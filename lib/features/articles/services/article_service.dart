import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/article.dart';

class ArticleService {
  static const String baseUrl = 'http://127.0.0.1:8000';

  Future<List<Article>> fetchArticles() async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/v1/articles/'),
    );

    if (response.statusCode == 200) {
      final dynamic data = jsonDecode(response.body);

      final List<dynamic> results = data is List
          ? data
          : data['results'];

      return results
          .map((json) => Article.fromJson(json))
          .toList();
    } else {
      throw Exception(
        'Failed to load articles: ${response.statusCode}',
      );
    }
  }
}