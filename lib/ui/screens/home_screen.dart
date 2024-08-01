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
    final TextEditingController _searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Noticias')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Buscar noticias',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    context
                        .read<NewsBloc>()
                        .add(SearchNews(_searchController.text));
                  },
                ),
              ),
            ),
          ),
          const CategorySelector(),
          Expanded(
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is NewsLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is NewsLoaded) {
                  return NewsList(news: state.news);
                } else if (state is NewsSearchLoaded) {
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
