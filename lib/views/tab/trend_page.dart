import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:qiita_client/apis/qiita-api.dart';
import 'package:qiita_client/provider/app_state.dart';
import 'package:qiita_client/utils/importer.dart';
import 'package:qiita_client/views/widget/article_list.dart';

class TrendPage extends HookWidget {
  const TrendPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const QiitaArticleList();
  }
}

class QiitaArticleList extends HookWidget {
  const QiitaArticleList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final articles = useProvider(articleProvider);
    return ArticleList(
      data: articles,
      stocked: false,
    );
  }
}
