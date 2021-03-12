import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'qiita_client.dart';

void main() {
  runApp(MyApp(
    items: List<String>.generate(10000, (i) => "$i番目"),
  ));
  QiitaClient.fetchArticle().then((articles) => {
    articles.forEach((article) => {
      print(article.title)
    })
  });
}

class MyApp extends StatelessWidget {
  final List<String> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = '最新記事一覧';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${items[index]}'),
            );
          },
        ),
      ),
    );
  }
}

