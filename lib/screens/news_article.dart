import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/models.dart';

class NewsArticle extends StatelessWidget {
  Article articlesList;

  NewsArticle({this.articlesList, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  articlesList.urlImage,
                  fit: BoxFit.fill,
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              height: 70,
              child: Row(
                children: [
                  VerticalDivider(
                    thickness: 5,
                    color: Colors.orange,
                  ),
                  Container(
                      width: 300,
                      child: Text(articlesList.title,
                          style: GoogleFonts.abrilFatface(
                              fontSize: 20,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold))),

                ],
              ),


            ),

            SizedBox(height: 20),

            Container(

                padding: EdgeInsets.only(left: 20,right: 20),

                child: Text(articlesList.content,style: GoogleFonts.abel(fontSize:30 ),))

          ],
        ),
      ),
    );
  }
}
