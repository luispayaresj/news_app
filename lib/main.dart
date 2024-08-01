import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:news_app/blocs/news/news_bloc.dart';
import 'package:news_app/repositories/news_repositories.dart';
import 'package:news_app/ui/screens/home_screen.dart';

void main() {
  final newsRepository = NewsRepository();
  runApp(MyApp(newsRepository: newsRepository));
}

class MyApp extends StatelessWidget {
  final NewsRepository newsRepository;

  MyApp({required this.newsRepository});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        Provider<NewsRepository>(
          create: (_) => NewsRepository(),
        ),
        BlocProvider<NewsBloc>(
          create: (context) => NewsBloc(context.read<NewsRepository>()),
        ),
      ],
      child: MaterialApp(
        title: 'Noticias',
        home: HomeScreen(),
      ),
    );
  }
}

