import 'package:flutter/material.dart';
import 'article.dart';
import 'qiita_client.dart';
import 'main.dart';


class ArticleListPage extends StatelessWidget {
  final Future<List<Article>> articles = QiitaClient.fetchArticle();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Qiita API '),
        ),
        body: Center(
          child: FutureBuilder<List<Article>>(
            future: articles,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ArticleListView(articles: snapshot.data);
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}