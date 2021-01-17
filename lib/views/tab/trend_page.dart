import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:qiita_client/apis/qiita-api.dart';
import 'package:qiita_client/models/article.dart';
import 'package:qiita_client/views/widget/article_list.dart';
import 'package:qiita_client/views/widget/article_page.dart';

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
    return Expanded(child: ArticleList(data: data));
  }
}
