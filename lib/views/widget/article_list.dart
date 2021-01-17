import 'package:qiita_client/models/article.dart';
import 'package:qiita_client/views/widget/article_page.dart';

import '../../utils/importer.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({Key key, @required this.data}) : super(key: key);

  final Future<List<Article>> data;

  @override
  Widget build(BuildContext context) {
    print('dataは $data');

    if (data == null) return Center(child: Text('記事リスト'),);

    return FutureBuilder(
      future: data,
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        final repos = snapshot.data;
        if (snapshot.hasData) {
          return  ListView(
                  shrinkWrap: true,
                  children: repos
                      .map((value) => Card(
                          child: FlatButton(
                              child: Text(value.title),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ArticlePage(data: value))))))
                      .toList());
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error Occared!'),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
