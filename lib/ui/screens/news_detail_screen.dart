import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';

class NewsDetailScreen extends StatelessWidget {
  final News news;

  NewsDetailScreen({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(news.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(news.imageUrl),
            SizedBox(height: 16.0),
            Text(news.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text(news.date.toString(), style: TextStyle(color: Colors.grey)),
            SizedBox(height: 16.0),
            Text(news.description),
          ],
        ),
      ),
    );
  }
}
