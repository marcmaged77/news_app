import 'package:flutter/material.dart';
import 'package:news_app/viewModels/articles_list_view_model.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ArticlesListViewModel>(
      create: (context) => ArticlesListViewModel(),

      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

