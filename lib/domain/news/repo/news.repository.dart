import 'package:dartz/dartz.dart';
import 'package:newz_app/domain/common/base/base_failure.dart';
import 'package:newz_app/domain/news/entity/news.entity.dart';

abstract class NewsRepository {
  Future<Either<List<NewsEntity>, Failure>> topHeadlines();
}