import 'package:flutter/material.dart';
import 'package:news_app/models/models.dart';
import 'package:news_app/screens/news_article.dart';
import 'package:news_app/viewModels/articles_list_view_model.dart';
import 'package:provider/provider.dart';

class newsList extends StatelessWidget {
  List<Article> articles;

  newsList({this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: this.articles.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {

            Navigator.push(context, MaterialPageRoute(builder:(context){
              return NewsArticle(articlesList: this.articles[index],);
            }));
            print(this.articles[index]);
          },
          isThreeLine: true,
          leading: Container(
            height: 200,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                image: DecorationImage(
                    image: NetworkImage(this.articles[index].urlImage != null
                        ? articles[index].urlImage
                        : 'https://images.hindustantimes.com/img/2021/09/09/1600x900/BREAKING_NEWS_1631230366821_1631230369778.jpg'),
                    fit: BoxFit.fill)),
          ),
          title: Text(articles[index].title),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('20 minutes ago'),
              IconButton(
                icon: Icon(
                  Icons.share,
                  size: 20,
                ),
                onPressed: () {},
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        height: 30,
      ),
    );
  }
}
