import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/news/news_bloc.dart';
import 'package:news_app/blocs/news/news_event.dart';
import 'package:news_app/repositories/news_repositories.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = context.read<NewsRepository>().fetchCategories();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {
                context.read<NewsBloc>().add(LoadNews(category.id));
              },
              child: Text(category.name),
            ),
          );
        }).toList(),
      ),
    );
  }
}
