import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:good_news_flutter/app/models/News.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsOpenScreen extends StatefulWidget {
  const NewsOpenScreen({
    Key key,
    @required this.model,
  }) : super(key: key);

  final News model;

  @override
  _NewsOpenScreenState createState() => _NewsOpenScreenState();
}

class _NewsOpenScreenState extends State<NewsOpenScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model.newsSource.name),
        elevation: Platform.isIOS ? 0 : 4,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () => Share.share(widget.model.link),
          ),
          IconButton(
            icon: Icon(Icons.star_border),
            onPressed: () {},
          ),
        ],
      ),
      body: _buildContents(),
    );
  }

  Widget _buildContents() {
    return Builder(builder: (BuildContext context) {
      return WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: widget.model.link,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      );
    });
  }
}