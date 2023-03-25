import 'dart:convert';

import 'package:news_feed_2/model/news_model.dart';

import '../data/category_info.dart';
import '../data/search_type.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  static const API_KEY = "d97a0c050f074f86be6443844286558a";
  static const BASE_URL = "https://newsapi.org/v2/top-headlines?country=us";

  Future<List<Article>> getNews(
      {required SearchType searchType, String? keyword, Category? category}) async{
    print('repository/$searchType/$keyword/${category?.nameJp}');
    List<Article> result = [];
    http.Response? response;
    switch (searchType) {
      case SearchType.HEAD_LINE:
        final requestUrl = Uri.parse(BASE_URL + "&apiKey=$API_KEY");
        response = await http.get(requestUrl);
        break;
      case SearchType.KEYWORD:
        final requestUrl = Uri.parse(BASE_URL + "&q=$keyword&apiKey=$API_KEY");
        response = await http.get(requestUrl);
        break;
      case SearchType.CATEGORY:
        final requestUrl = Uri.parse(BASE_URL + "&category=${category?.nameEn}&apiKey=$API_KEY");
        response = await http.get(requestUrl);
        break;
    }
    if (response.statusCode == 200) {
      final responseBody = response.body;
      result = News.fromJson(jsonDecode(responseBody)).articles;
    } else {
      throw Exception('失敗');
    }
    return result;
  }
}