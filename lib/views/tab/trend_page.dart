import 'package:flutter/material.dart';

class TrendPage extends StatelessWidget {
  const TrendPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('トレンドのページだよ'),
          subtitle: Text('サブタイトルだよ'),
        )
      ],
    );
  }
}
