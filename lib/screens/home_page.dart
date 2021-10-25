import 'package:flutter/material.dart';
import 'package:news_app/screens/news_by_cat.dart';
import 'package:news_app/viewModels/articles_list_view_model.dart';
import 'package:provider/provider.dart';
import 'screens.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  fetchData() async {
    await Provider.of<ArticlesListViewModel>(context, listen: false)
        .fetchData();
    print(Provider.of<ArticlesListViewModel>(context, listen: false)
        .articlesList
        .length);
  }

  fetchDataByCat(String category) async {
    await Provider.of<ArticlesListViewModel>(context, listen: false)
        .fetchDataByCat(category);
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;

    return Consumer<ArticlesListViewModel>(builder: (context, data, child) {
      return DefaultTabController(
        length: 8,
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 80,
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                    height: 50,
                    child: Image.asset(
                      'assets/images/Logo/Logo.png',
                      color: Colors.orange,
                    )),
              ),
              bottom: TabBar(
                  indicatorColor: Colors.orange,
                  isScrollable: true,
                  unselectedLabelStyle: TextStyle(color: Colors.grey),
                  tabs: [
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'all news',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'General',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Business',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Health',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Entertainment',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Science',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Sports',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Technology',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ]),
            ),
            body: TabBarView(children: [
              AllNews(
                name: 'marc',
                articles:
                    Provider.of<ArticlesListViewModel>(context, listen: false)
                        .articlesList,
              ),
              newsByCat(
                name: 'sports',
              ),
              newsByCat(
                name: 'business',
              ),
              newsByCat(
                name: 'health',
              ),
              newsByCat(
                name: 'entertainment',
              ),
              newsByCat(
                name: 'science',
              ),
              newsByCat(
                name: 'sports',
              ),
              newsByCat(
                name: 'technology',
              ),
            ])),
      );
    });
  }
}
