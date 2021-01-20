import 'package:qiita_client/provider/app_state.dart';
import 'package:qiita_client/models/article.dart';
import 'package:qiita_client/views/widget/article_page.dart';

import '../../utils/importer.dart';

class ArticleList extends HookWidget {
  ArticleList({Key key, @required this.data, @required this.stocked})
      : super(key: key);

  final AsyncValue<List<Article>> data;
  final bool stocked;

  @override
  Widget build(BuildContext context) {
    return data?.when(
      loading: () => const Center(child: CircularProgressIndicator(),) ,
      error: (error, stack) => const Text('Oops'),
      data: (articles) => ArticleListView(stocked: stocked, data: articles),
    );
  }
}

class ArticleListView extends StatelessWidget {
  const ArticleListView({Key key, @required this.stocked, @required this.data})
      : super(key: key);

  final bool stocked;
  final List<Article> data;

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        children: data
            ?.map((value) => Card(
                child: FlatButton(
                    child: Text(value.title),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArticlePage(
                                  data: value,
                                  stocked: stocked,
                                ))))))
            ?.toList());
  }
}
