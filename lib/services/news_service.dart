import 'package:news_app/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String apiKey = '7e4b35fcf6fa49dcaefb53bc1317c25c#';

String url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';

class NewsApi {


  Future<List<Article>> fetchArticles() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);


          ArticlesList articles = ArticlesList.fromJson(decodedData);

          //7awel kol el maps le Article model 3ashan yetargemha we yehael kol el maps le list 3an tari2 map we to list
         List<Article> articlesList = articles.articles.map((e) => Article.fromJson(e)).toList();

return articlesList;


    } else {
      print('status code: ${response.statusCode}');
    }
  }




  Future<List<Article>> fetchArticlesByCat(String category) async {
    http.Response response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey'));

    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);


          ArticlesList articles = ArticlesList.fromJson(decodedData);

          //7awel kol el maps le Article model 3ashan yetargemha we yehael kol el maps le list 3an tari2 map we to list
         List<Article> articlesList = articles.articles.map((e) => Article.fromJson(e)).toList();

return articlesList;


    } else {
      print('status code: ${response.statusCode}');
    }
  }


}
