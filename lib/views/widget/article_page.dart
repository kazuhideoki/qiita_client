import 'package:qiita_client/models/article.dart';
import '../../utils/importer.dart';


class ArticlePage extends StatelessWidget {
  ArticlePage({Key key, @required this.data});

  Article data;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Qiita App',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(title: Text(data.title), leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          tooltip: '戻る',
          onPressed: () => Navigator.pop(context)),
        ),
          body: ColoredBox(
            color: Colors.white,
            child: SingleChildScrollView(
              child: HtmlWidget(data.renderedBody),
            ),
          ),
        ));
  }
}
