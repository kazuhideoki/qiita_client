import 'package:qiita_client/provider/app_state.dart';
import 'package:qiita_client/models/article.dart';
import 'package:qiita_client/views/widget/article_page.dart';

import '../../utils/importer.dart';

class ArticleList extends HookWidget {
  ArticleList(
      {Key key, @required this.data, @required this.stocked, this.isLgtmOrder = false})
      : super(key: key);

  final AsyncValue<List<Article>> data;
  final bool stocked;
  final bool isLgtmOrder;

  @override
  Widget build(BuildContext context) {
    return data?.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stack) => const Text('Oops'),
      data: (articles) {
        if (isLgtmOrder == true) {
          articles?.sort((a, b) => b.likesCount.compareTo(a.likesCount));
        }
        return ListView(
        
        shrinkWrap: true,
        children: articles
            ?.map((value) => Card(
                child: FlatButton(
                    child: Row(children: [Expanded(child: Text(value.title)),Text(value.likesCount.toString())], ),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArticlePage(
                                  data: value,
                                  stocked: stocked,
                                ))))))
            ?.toList());
      },
    );
  }
}

