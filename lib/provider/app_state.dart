import 'package:qiita_client/apis/qiita-api.dart';
import 'package:qiita_client/models/article.dart';
import 'package:qiita_client/utils/importer.dart';

final articleProvider = FutureProvider<List<Article>>((ref) {
  return QiitaApi().getArticles();
});
final stockArticleProvider = FutureProvider<List<Article>>((ref) {
  return QiitaApi().getStockArticles();
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
