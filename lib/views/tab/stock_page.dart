import 'package:flutter/material.dart';

class StockPage extends StatelessWidget {
  const StockPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('ストックのページだよ'),
          subtitle: Text('保存しよう'),
        )
      ],
    );
  }
}
