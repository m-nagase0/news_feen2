
import 'package:flutter/material.dart';
import 'package:news_feed_2/view/screens/hose_screen.dart';
import 'package:news_feed_2/view/viewmodels/head_line_view_model.dart';
import 'package:news_feed_2/view/viewmodels/news_list_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<NewsListViewModel>(
          create: (context) => NewsListViewModel()),
      ChangeNotifierProvider<HeadLineViewModel>(
          create: (context) => HeadLineViewModel())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'news_feed_2',
      theme: ThemeData(brightness: Brightness.dark),
      home: HomeScreen(),
    );
  }
}
