import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:qiita_client/main.dart';
import 'package:qiita_client/views/tab/search_page.dart';
import 'package:qiita_client/views/tab/stock_page.dart';
import 'package:qiita_client/views/tab/trend_page.dart';

class HomeView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var currentIndex = useState(0);
    final switchTab = (int index) {
      currentIndex.value = index;
    };

    return Scaffold(
      body: IndexedStack(
        index: currentIndex.value,
        children: [
          for (final tabItem in TabNavigationItem.items) tabItem.page,
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex.value,
        onTap: (int index) => switchTab(index),
        items: [
          for (final tabItem in TabNavigationItem.items)
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

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: TrendPage(),
          icon: Icon(Icons.trending_up),
          title: "Trend",
        ),
        TabNavigationItem(
          page: SearchPage(),
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
