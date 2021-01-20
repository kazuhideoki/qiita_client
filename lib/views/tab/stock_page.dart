import 'package:qiita_client/apis/qiita-api.dart';
import 'package:qiita_client/provider/app_state.dart';
import 'package:qiita_client/views/widget/article_list.dart';

import '../../utils/importer.dart';

class StockPage extends HookWidget {
  const StockPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stockArticles = useProvider(stockArticleProvider);

    return ArticleList(
      data: stockArticles,
      stocked: true,
    );
  }
}
