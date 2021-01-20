import 'package:qiita_client/apis/qiita-api.dart';
import 'package:qiita_client/provider/app_state.dart';
import 'package:qiita_client/models/article.dart';
import '../../utils/importer.dart';

class ArticlePage extends HookWidget {
  ArticlePage({
    Key key,
    this.stocked = false,
    @required this.data,
  });

  final Article data;
  final bool stocked;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(data.title),
        leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            tooltip: '戻る',
            onPressed: () => Navigator.pop(context)),
        actions: [
          stocked
              ? Consumer(builder: (BuildContext context, watch, child) {
                  final state = watch(stockArticleProvider);
                  return IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        try {
                          await QiitaApi().removeStockArticle(data.id);
                          context.refresh(stockArticleProvider);

                          _scaffoldKey.currentState
                              .showSnackBar(snackBar('ストックから削除しました'));
                        } catch (err) {
                          print('removeStockArticle: $err');
                        }
                      });
                })
              : IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () async {
                    try {
                      await QiitaApi().stockArticle(data.id);
                      context.refresh(stockArticleProvider);
                      
                      _scaffoldKey.currentState
                          .showSnackBar(snackBar('ストックに追加しました'));
                    } catch (err) {
                      print('addStockArticle: $err');
                    }
                  })
        ],
      ),
      body: ColoredBox(
        color: Colors.white,
        child: SingleChildScrollView(
          child: HtmlWidget(data.renderedBody),
        ),
      ),
    )
        // )
        ;
  }
}

final snackBar = (String message) => SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );