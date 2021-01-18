import 'package:qiita_client/apis/qiita-api.dart';
import 'package:qiita_client/views/widget/article_list.dart';

import '../../utils/importer.dart';

class StockPage extends StatelessWidget {
  const StockPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = QiitaApi().getStockArticles();

    return ArticleList(data: data, stocked: true,);
  }
}
