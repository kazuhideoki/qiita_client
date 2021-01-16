import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:qiita_client/apis/repos.dart';
import 'package:qiita_client/models/repository.dart';

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
    final data = RepositoriesApi().getApi();
    return FutureBuilder(
      future: data,
      initialData: null,
      builder:
          (BuildContext context, AsyncSnapshot<List<Repository>> snapshot) {
        final repos = snapshot.data;
        if (snapshot.hasData) {
          return ListView(
              children: repos.map((value) => Text(value.title)).toList());
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
