import 'package:flutter/material.dart';
import 'package:news_feed_2/data/category_info.dart';
import 'package:news_feed_2/data/search_type.dart';
import 'package:news_feed_2/model/news_model.dart';
import 'package:news_feed_2/view/components/article_tile.dart';
import 'package:news_feed_2/view/viewmodels/news_list_viewmodel.dart';
import 'package:provider/provider.dart';
import '../components/category_chips.dart';
import '../components/search_bar.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<NewsListViewModel>();
    if (!viewModel.isLoading && viewModel.articles.isEmpty) {
      Future(() => viewModel.getNews(
          searchType: SearchType.CATEGORY, category: categories[0]));
    }

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
            SearchBar(
              onSearch: (keyword) => getKeyword(context, keyword),
            ),
            //TODO カテゴリー選択
            CategoryChips(
              onCategorySelected: (category) => getCategory(context, category),
            ),
            Expanded(
              child:
                  Consumer<NewsListViewModel>(builder: (context, model, child) {
                return model.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: model.articles.length,
                        itemBuilder: (context, int index) {
                          return ArticleTile(
                            article: model.articles[index],
                            onArticleClicked: (article) =>
                                _openArticleWebPage(context, article),
                          );
                        });
              }),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onRefresh(BuildContext context) async {
    final viewModel = context.read<NewsListViewModel>();
    await viewModel.getNews(
      searchType: viewModel.searchType,
      keyword: viewModel.keyword,
      category: viewModel.category,
    );
    print('onRefresh');
  }

  Future<void> getKeyword(BuildContext context, keyword) async {
    final viewModel = context.read<NewsListViewModel>();
    await viewModel.getNews(
      searchType: SearchType.KEYWORD,
      keyword: keyword,
      category: categories[0],
    );
    print('getKeyword');
  }

  Future<void> getCategory(BuildContext context, Category category) async {
    final viewModel = context.read<NewsListViewModel>();
    await viewModel.getNews(
      searchType: SearchType.CATEGORY,
      category: category,
    );
    print(category.nameJp);
  }


  //TODO
  _openArticleWebPage(BuildContext context, Article article) {
    print(article.description);
  }
}
