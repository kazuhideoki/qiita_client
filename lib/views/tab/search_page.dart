import 'package:flutter/material.dart';
import 'package:qiita_client/apis/qiita-api.dart';
import 'package:qiita_client/models/article.dart';
import 'package:qiita_client/utils/importer.dart';
import 'package:qiita_client/views/widget/article_list.dart';

class SearchPage extends HookWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final text = useState('');
    final data = useState();
    return Column(
      children: [
        TextField(
          onSubmitted: (String query) {
            data.value = QiitaApi().getArticles(query: query, perPage: 20);
          },
        ),
        Expanded(child: ArticleList(data: data.value))
        
      ],
    );
  }
}
