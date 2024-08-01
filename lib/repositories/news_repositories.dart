import 'package:news_app/models/category.dart';
import 'package:news_app/models/news.dart';

class NewsRepository {
  final List<News> _news = [
    News(
      title: 'Aprobación de Nueva Reforma Electoral',
      description:
          'El Congreso aprobó una nueva reforma electoral que promete modernizar el proceso de votación.',
      date: DateTime(2024, 8, 1),
      imageUrl: 'https://i.imgur.com/3XDdEIQ.jpeg',
      categoryId: 'politics',
    ),
    News(
      title: 'La Bolsa de Valores Cierra en Números Rojos',
      description:
          'Las acciones cayeron bruscamente debido a preocupaciones sobre la inflación.',
      date: DateTime(2024, 8, 1),
      imageUrl: 'https://i.imgur.com/G5WwarW.jpeg',
      categoryId: 'economy',
    ),
    News(
      title: 'El Equipo Nacional Gana el Campeonato Mundial',
      description:
          'El equipo nacional de fútbol ha ganado el campeonato mundial en un emocionante partido.',
      date: DateTime(2024, 8, 1),
      imageUrl: 'https://i.imgur.com/ps5ItId.jpeg',
      categoryId: 'sports',
    ),
    News(
      title: 'Nuevo Smartphone Revoluciona el Mercado',
      description:
          'La última tecnología en smartphones promete cambiar la forma en que interactuamos con nuestros dispositivos.',
      date: DateTime(2024, 8, 1),
      imageUrl: 'https://i.imgur.com/Ctkr2qx.jpeg',
      categoryId: 'tech',
    ),
  ];
  // Simulación de datos
  List<News> fetchNewsByCategory(String categoryId) {
    // Aquí iría la lógica para obtener las noticias filtradas por categoría
    if (categoryId == 'all') {
      return _news;
    }
    {
      return _news.where((news) => news.categoryId == categoryId).toList();
    }
  }

  List<Category> fetchCategories() {
    // Aquí iría la lógica para obtener las categorías
    return [
      Category(id: 'all', name: 'Ultimas noticias'),
      Category(id: 'politics', name: 'Política'),
      Category(id: 'economy', name: 'Economía'),
      Category(id: 'sports', name: 'Deportes'),
      Category(id: 'tech', name: 'Tecnología'),
    ];
  }
}
