import 'package:flutter/material.dart';
import 'article.dart';
import 'package:webview_flutter/webview_flutter.dart';




class ArticleDetailPage extends StatelessWidget {
  final Article article;

  ArticleDetailPage({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: MaterialApp(
          title: 'Fetch Data Example',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
            body: Center(
              child: WebView(
                initialUrl: article.url,
              ),
            ),
          ),
        ),
      ),
    );
  }
}