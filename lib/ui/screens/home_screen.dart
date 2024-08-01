import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/news/news_bloc.dart';
import 'package:news_app/blocs/news/news_event.dart';
import 'package:news_app/blocs/news/news_state.dart';
import 'package:news_app/ui/widgets/news_list.dart';
import 'package:news_app/ui/widgets/category_selector.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<NewsBloc>().add(LoadNews("all"));
    return Scaffold(
      appBar: AppBar(title: Text('Noticias')),
      body: Column(
        children: [
          const CategorySelector(),
          Expanded(
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is NewsLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is NewsLoaded) {
                  return NewsList(news: state.news);
                } else {
                  return Center(child: Text('Error al cargar noticias'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
