import 'package:flutter/material.dart';
import 'package:news_feed_2/view/screens/about_us_page.dart';
import 'package:news_feed_2/view/screens/head_line_page.dart';
import 'package:news_feed_2/view/screens/news_list_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final _pages = [
    HeadLinePage(),
    NewsListPage(),
    AboutUsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.highlight), label: "トップニュース"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'ニュース一覧'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'about us')
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
