import 'package:newz_app/domain/news/entity/news.entity.dart';

abstract class NewsApi {
  Future<List<NewsEntity>> topHeadlines();
}