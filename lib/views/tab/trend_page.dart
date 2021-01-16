import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:qiita_client/apis/qiita-api.dart';
import 'package:qiita_client/models/article.dart';
import 'package:qiita_client/views/article_page.dart';

class TrendPage extends HookWidget {
  const TrendPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const QiitaArticleList();
  }
}

class QiitaArticleList extends StatelessWidget {
  const QiitaArticleList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = QiitaApi().getArticles();
    return FutureBuilder(
      future: data,
      initialData: null,
      builder:
          (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        final repos = snapshot.data;
        if (snapshot.hasData) {
          return ListView(
              children: repos
                  .map((value) => Card(
                      child: FlatButton(
                          child: Text(value.title),
                          onPressed: () => Navigator.push(context, MaterialPageRoute(
                              builder: (context) => ArticlePage(
                                  data: value)) ))))
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
