abstract class NewsEvent {}

class LoadNews extends NewsEvent {
  final String categoryId;

  LoadNews(this.categoryId);
}

class SearchNews extends NewsEvent {
  final String query;

  SearchNews(this.query);
}