abstract class NewsEvent {}

class LoadNews extends NewsEvent {
  final String categoryId;

  LoadNews(this.categoryId);
}
