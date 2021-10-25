import 'models.dart';

class ArticlesList {
 final int totalResults;

  final List<dynamic> articles;

  ArticlesList({ this.totalResults,  this.articles});

  factory ArticlesList.fromJson(Map<String, dynamic> jsonData) {
    return ArticlesList(
        totalResults: jsonData['totalResults'],
        articles: jsonData['articles']);
  }
}
