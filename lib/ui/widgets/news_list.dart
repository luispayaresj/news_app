import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/ui/screens/news_detail_screen.dart';

class NewsList extends StatelessWidget {
  final List<News> news;

  const NewsList({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
        final item = news[index];
        return ListTile(
          title: Text(item.title),
          subtitle: Text(item.description),
          leading: Image.network(item.imageUrl),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsDetailScreen(news: item),
              ),
            );
          },
        );
      },
    );
  }
}
