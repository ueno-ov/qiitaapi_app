import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'article.dart';

class QiitaClient {
  static Future<List<Article>> fetchArticle() async {
    final url = 'https://qiita.com/api/v2/items';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> jsonArray = json.decode(response.body);
      return jsonArray.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load article');
    }
  }
}