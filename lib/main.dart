import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'article.dart';
import 'article_detail_page.dart';
import 'article_list_page.dart';

class ArticleListView extends StatelessWidget {
  final List<Article> articles;
  ArticleListView({Key key, this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) {
        final article = articles[index];
        return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(article.user.iconUrl),
            ),
            title: Text(article.title),
            subtitle: Text(article.user.id),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ArticleDetailPage(article: article)),
              );
            });
      },
    );
  }
}

void main() {
  runApp(ArticleListPage());
}