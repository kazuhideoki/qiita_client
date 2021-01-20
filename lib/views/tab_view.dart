import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:qiita_client/views/tab/home_page.dart';
import 'package:qiita_client/views/tab/stock_page.dart';

class HomeView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);
    final switchTab = (int index) {
      currentIndex.value = index;
    };
    final focusNode = useState(FocusNode());

    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex.value,
          children: [
            for (final tabItem
                in TabNavigationItem.items(focusNode: focusNode.value))
              tabItem.page,
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex.value,
        onTap: (int index) {
          switchTab(index);
          if (index == 0) {
            focusNode.value.requestFocus();
          }
        },
        items: [
          for (final tabItem in TabNavigationItem.items())
            BottomNavigationBarItem(
              icon: tabItem.icon,
              label: tabItem.title,
            )
        ],
      ),
    );
  }
}

class TabNavigationItem {
  final Widget page;
  final String title;
  final Icon icon;

  TabNavigationItem({
    @required this.page,
    @required this.title,
    @required this.icon,
  });

  static List<TabNavigationItem> items({FocusNode focusNode}) => [
        TabNavigationItem(
          page: HomePage(focusNode: focusNode),
          icon: Icon(Icons.search),
          title: "Search",
        ),
        TabNavigationItem(
          page: StockPage(),
          icon: Icon(Icons.save),
          title: "Stock",
        ),
      ];
}
