import 'package:flutter/material.dart';
import 'package:qiita_client/apis/repos.dart';
import 'package:qiita_client/models/repository.dart';

class TrendPage extends StatelessWidget {
  const TrendPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = RepositoriesApi().getApi('kazuhideoki');
    return FutureBuilder(
      future: data,
      initialData: null,
      builder:
          (BuildContext context, AsyncSnapshot<List<Repository>> snapshot) {
        final repos = snapshot.data;
        if (snapshot.hasData) {
          return ListView(
            children: repos.map((value) => Text(value.name)).toList()
          );
        } else {
          return Text('no data');
        }
      },
    );
  }
}
