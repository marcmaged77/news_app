import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/components/news_list.dart';
import 'package:news_app/models/models.dart';
import 'package:news_app/viewModels/articles_list_view_model.dart';
import 'package:provider/provider.dart';

class newsByCat extends StatefulWidget {
  List<Article> articles;
  String name;

  newsByCat({ @required this.name, this.articles });

  @override
  _newsByCatState createState() => _newsByCatState();
}

class _newsByCatState extends State<newsByCat> {



  fetchDataByCat(String category)async{
    await Provider.of<ArticlesListViewModel>(context, listen: false).fetchDataByCat(category);
  }


  @override
  void initState() {
    // TODO: implement initState

  fetchDataByCat(widget.name);
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    var width = size.width;
    var height = size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [

              Consumer<ArticlesListViewModel>(
                builder: (context, articles, child){
                  return Container(
                    height: 250,
                    child: CarouselSlider.builder(
                      itemCount: articles.articlesListByCat.length,
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                      ),
                      itemBuilder: (context, index, realid) {
                        return Stack(children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0.1,
                                  blurRadius: 5,
                                  offset:
                                  Offset(0, 7), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  colorFilter: new ColorFilter.mode(
                                      Colors.black.withOpacity(0.6),
                                      BlendMode.darken),
                                  image: NetworkImage(

                                      articles.articlesListByCat[index].urlImage !=
                                      null
                                      ?articles.articlesListByCat[index].urlImage
                                      : 'https://images.hindustantimes.com/img/2021/09/09/1600x900/BREAKING_NEWS_1631230366821_1631230369778.jpg'),
                                  fit: BoxFit.fill

                              ),
                            ),
                          ),

                          Positioned(
                              left:10,
                              top:9,
                              child: Text(articles.articlesListByCat[index].dateTime, style: GoogleFonts.newsCycle(color: Colors.white,fontSize: 13,letterSpacing: 2),)),
                          Positioned(
                              left: 10,
                              bottom: 20,
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Container(
                                  width: 270,
                                  child: Text(articles.articlesListByCat[index].title,
                                      style: GoogleFonts.newsCycle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          letterSpacing: 2)),
                                ),
                              ))
                        ]);
                      },
                    ),
                  );
                },

              ),




              SizedBox(
                height: 10,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  child: Text(widget.name, style: TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),)),
              SizedBox(
                height: 10,
              ),

              newsList(articles: Provider.of<ArticlesListViewModel>(context,listen: false).articlesListByCat,)


            ],
          ),
        ),
      ),
    );
  }
}
