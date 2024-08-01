import 'package:news_app/models/news.dart';

abstract class NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<News> news;

  NewsLoaded(this.news);
}

class NewsError extends NewsState {}
