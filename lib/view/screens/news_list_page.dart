import 'package:flutter/material.dart';

import '../components/search_bar.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () => onRefresh(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //TODO 検索ワード
            SearchBar(onSearch: (keyword) => getKeyword(context),),
            //TODO カテゴリー選択
            //CategoryChips(),
            Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onRefresh(BuildContext context) {
    print('onRefresh');
  }

  getKeyword(BuildContext context) {
    print('getKeyword');
  }


}
