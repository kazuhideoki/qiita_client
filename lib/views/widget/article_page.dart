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
  bool stocked;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final state = useProvider(stockArticleProvider);
    return
        //  MaterialApp(
        //     title: 'Qiita App',
        //     theme: ThemeData(
        //       primarySwatch: Colors.orange,
        //       visualDensity: VisualDensity.adaptivePlatformDensity,
        //     ),
        //     home:
        Scaffold(
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

// Find the Scaffold in the widget tree and use
// it to show a SnackBar.

void stockedDialog(context) {
  showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('This is a demo alert dialog.'),
              Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
