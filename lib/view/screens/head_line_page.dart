import 'package:flutter/material.dart';
import 'package:news_feed_2/model/news_model.dart';
import 'package:news_feed_2/view/components/head_line_item.dart';
import 'package:news_feed_2/view/viewmodels/head_line_view_model.dart';
import 'package:provider/provider.dart';

import '../../data/search_type.dart';

class HeadLinePage extends StatelessWidget {
  const HeadLinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HeadLineViewModel>();
    if (!viewModel.isLoading && viewModel.articles.isEmpty) {
      Future(() => viewModel.getHeadLines(searchType: SearchType.HEAD_LINE));
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<HeadLineViewModel>(builder: (context, model, child) {
          if (model.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else {
            return PageView.builder(
                controller: PageController(viewportFraction: 0.9),
                itemCount: model.articles.length,
                itemBuilder: (context, index) {
                  final article = model.articles[index];
                  return HeadLineItem(
                    article: article,
                    onArticleClicked: (article) => openWebPage(context, article),
                  );
                });
          }

        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onRefresh(context),
        child: const Icon(Icons.refresh),
      ),
    );
  }

  onRefresh(BuildContext context) async {
    final viewModel = context.read<HeadLineViewModel>();
    await viewModel.getHeadLines(searchType: SearchType.HEAD_LINE);
  }

  openWebPage(BuildContext context, Article article) {
    print(article.url);
  }
}
