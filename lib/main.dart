import 'package:flutter/material.dart';
import 'package:news_feed_2/view/screens/hose_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'news_feed_2',
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      home: HomeScreen(),
    );
  }
}
