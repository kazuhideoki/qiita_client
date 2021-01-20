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
    // if (data == null)
    //   return Center(
    //     child: Text('記事リスト'),
    //   );
    // return ArticleListView(
    //         data: data,
    //         stocked: stocked,
    //       );

    return data?.when(
    loading: () => const CircularProgressIndicator(),
    error: (error, stack) => const Text('Oops'),
    data: (articles) => ArticleListView(stocked: stocked, data: articles),
  );


    // return FutureBuilder(
    //   future: data,
    //   initialData: null,
    //   builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
    //     final repos = snapshot.data;
    //     if (snapshot.hasData) {
    //       return ArticleListView(
    //         data: repos,
    //         stocked: stocked,
    //       );
    //     } else if (snapshot.hasError) {
    //       return Center(
    //         child: Text('Error Occared!'),
    //       );
    //     } else {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //   },
    // );
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
        children: data?.map((value) => Card(
                child: FlatButton(
                    child: Text(value.title),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArticlePage(
                                  data: value,
                                  stocked: stocked,
                                ))))))?.toList());
  }
}
