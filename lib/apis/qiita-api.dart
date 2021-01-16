import 'package:dio/dio.dart';
import 'package:qiita_client/common/const.dart';
import 'package:qiita_client/models/article.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const d = 'https://qiita.com/api/v2/items?page=1&per_page=5';

class QiitaApi {
  Future<List<Article>> getArticles() async {

    final dio = new Dio();
    final url = Const.API_BASE + "/items" + "?page=1&per_page=5";
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
}
