import 'package:flutter/cupertino.dart';
import 'package:news_app/models/models.dart';
import 'package:news_app/services/news_service.dart';

class ArticlesListViewModel extends ChangeNotifier{
  List<Article> _articlesList = [];
  List<Article> _articlesListByCat = [];

  Future<void> fetchData() async {
    _articlesList = await NewsApi().fetchArticles();
    notifyListeners();
  }

 Future<void> fetchDataByCat(String category) async {
    _articlesListByCat = await NewsApi().fetchArticlesByCat(category);
    notifyListeners();
  }





  //encapsulation
  List<Article> get articlesList => _articlesList;

  List<Article> get articlesListByCat => _articlesListByCat;
}
