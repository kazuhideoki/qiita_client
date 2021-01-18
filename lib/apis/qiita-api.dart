import 'package:dio/dio.dart';
import 'package:qiita_client/common/const.dart';
import 'package:qiita_client/models/article.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const d = 'https://qiita.com/api/v2/items?page=1&per_page=5';

class QiitaApi {
  final dio = new Dio();

  Future<List<Article>> getArticles(
      {int page = 1, int perPage = 5, String query}) async {
    print('getArticleだ query: $query');
    return _apiItem('/items/?page=$page&per_page=$perPage&query=$query');
  }

  Future<List<Article>> getStockArticles(
      {int page = 1, int perPage = 5, String query}) async {
    print('getStockArticleだ');
    return _apiItem(
        '/users/${DotEnv().env['QIITA_USER']}/stocks/?page=$page&per_page=$perPage&query=$query');
  }

  Future<List<Article>> _apiItem(href) async {
    final url = Const.API_BASE + href;
    var data = await dio
        .get(
      url,
      options: Options(
        headers: {
          "Authorization": 'Bearer ${DotEnv().env['QIITA_TOKEN']}',
        },
      ),
    )
        .then((response) {
      List<Article> list = [];
      for (var date in response.data) {
        list.add(new Article.fromJson(date));
      }
      return list;
    }).catchError((err) {
      print(err);
      return null;
    });
    return data;
  }

  Future<void> stockArticle(String itemId) async {
    print('stockArticleだ');
    final url = Const.API_BASE + '/items/$itemId/stock';
    try {
      await dio.put(
        url,
        options: Options(
          headers: {
            "Authorization": 'Bearer ${DotEnv().env['QIITA_TOKEN']}',
          },
        ),
      );
    } catch (err) {
      print('stockArticle: $err');
      return null;
    }
  }

  Future<void> removeStockArticle(String itemId) async {
    print('removeStockArticleだ');
    final url = Const.API_BASE + '/items/$itemId/stock';
    try {
      await dio.delete(
        url,
        options: Options(
          headers: {
            "Authorization": 'Bearer ${DotEnv().env['QIITA_TOKEN']}',
          },
        ),
      );
    } catch (err) {
      print('removeStockArticle: $err');
      return null;
    }
  }
}
