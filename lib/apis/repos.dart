import 'package:dio/dio.dart';
import 'package:qiita_client/common/const.dart';
import 'package:qiita_client/models/repository.dart';

class RepositoriesApi {

  // ignore: missing_return
  Future<List<Repository>> getApi(name) async {

    final dio = new Dio();
    final url = Const.API_BASE + "/users/" + name + "/repos";
    var data = await dio
        .get(url,
      options: Options(
        headers: {
        },
      ),
    ).then((response) {

      List<Repository> list = [];
      for(var date in response.data) {
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