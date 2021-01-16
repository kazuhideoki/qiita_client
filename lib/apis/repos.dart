import 'package:dio/dio.dart';
import 'package:qiita_client/common/const.dart';
import 'package:qiita_client/models/repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const d = 'https://qiita.com/api/v2/items?page=1&per_page=5';

class RepositoriesApi {
  Future<List<Repository>> getApi() async {

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
      List<Repository> list = [];
      for (var date in response.data) {
        list.add(new Repository.fromJson(date));
      }
      return list;
    }).catchError((err) {
      print(err);
      return null;
    });
    return data;
  }
}
