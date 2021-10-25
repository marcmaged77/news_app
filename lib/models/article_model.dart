







// da el article el wahed gowah el key wel values dol ---- lessa hane3mel el list fe model tany el haygib articles ketir neek
class Article {

  final String title;
  final String description;
  final String articleUrl;
  final String content;
  final String urlImage;
  final String dateTime;

  Article({ this.title,  this.description,  this.articleUrl,  this.content,  this.urlImage, this.dateTime});




  //deserialize json :
  // the process of decoding the data that is in JSON format into native data type
factory Article.fromJson(Map<String,dynamic> jsonData){


return Article(
    title: jsonData['title'],
    urlImage: jsonData['urlToImage'],
    description: jsonData['description'],
    content: jsonData['content'],
    articleUrl: jsonData['url'],
   dateTime: jsonData['publishedAt']
);
}

}