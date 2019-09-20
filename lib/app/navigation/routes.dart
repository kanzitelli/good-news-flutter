import 'package:flutter/material.dart';
import 'package:good_news_flutter/app/navigation/tabs.dart';
import 'package:good_news_flutter/app/placeholder_page.dart';
import 'package:good_news_flutter/app/screens/news_screen.dart';

enum Path {
  news_root,
  bookmarks_root,
  settings_root,
  news_open,
}

class Routes {
  static Map<Path, String> paths = {
    Path.news_root: 'news',
    Path.bookmarks_root: 'bookmarks',
    Path.settings_root: 'settings',
    Path.news_open: 'news_open',
  };

  static Map<TabItem, String> rootPaths = {
    TabItem.news: paths[Path.news_root],
    TabItem.bookmarks: paths[Path.bookmarks_root],
    TabItem.settings: paths[Path.settings_root],
  };

  static Map<String, WidgetBuilder> builders = {
    paths[Path.news_root]: (context) => NewsScreen.create(context),
    paths[Path.bookmarks_root]
        : (context) => PlaceholderPage("Bookmarks"),
    paths[Path.settings_root]: (context) => PlaceholderPage("Settings"),
    paths[Path.news_open]: (context) => PlaceholderPage("News Open"),
  };
}