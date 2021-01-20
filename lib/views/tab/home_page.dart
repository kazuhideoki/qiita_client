import 'package:flutter/material.dart';
import 'package:qiita_client/provider/app_state.dart';
import 'package:qiita_client/utils/importer.dart';
import 'package:qiita_client/views/widget/article_list.dart';

class HomePage extends HookWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textQuery = useState();
    final articles = useProvider(articleProvider(textQuery.value));

    return Column(
      children: [
        TextField(
          onSubmitted: (String value) {
            textQuery.value = value;
          },
        ),
        Expanded(child: ArticleList(
          data: articles,
          stocked: false,
          isLgtmOrder: true,
        ))
        
      ],
    );
  }
}
