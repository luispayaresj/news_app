import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/news/news_event.dart';
import 'package:news_app/blocs/news/news_state.dart';
import 'package:news_app/repositories/news_repositories.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  NewsBloc(this.newsRepository) : super(NewsLoading()) {
    on<LoadNews>((event, emit) async {
      emit(NewsLoading());
      try {
        final news = newsRepository.fetchNewsByCategory(event.categoryId);
        emit(NewsLoaded(news));
      } catch (_) {
        emit(NewsError());
      }
    });
  }
}
