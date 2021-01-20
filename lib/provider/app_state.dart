import 'package:qiita_client/apis/qiita-api.dart';
import 'package:qiita_client/models/article.dart';
import 'package:qiita_client/utils/importer.dart';

final articleProvider = FutureProvider.autoDispose
    .family<List<Article>, String>((ref, query) async {
  final response = await QiitaApi().getArticles(query: query);
  ref.maintainState = true;
  return response;
});

final stockArticleProvider = FutureProvider.autoDispose<List<Article>>((ref) async {
  final response = await QiitaApi().getStockArticles();
  ref.maintainState = true;
  return response;
});

// class AppStateManager extends StateNotifier<AppState> {
//   AppStateManager() : super(null);

//   void setArticles(Future<List<Article>> value) {
//     state.articles = value;
//   }

//   void setStockArticles(Future<List<Article>> value) {
//     state.stockArticles = value;
//   }
// }

class AppState {
  AppState(this.articles, this.stockArticles);

  Future<List<Article>> articles;
  Future<List<Article>> stockArticles;
}
