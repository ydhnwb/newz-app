import 'package:dartz/dartz.dart';
import 'package:newz_app/domain/common/base/base_failure.dart';
import 'package:newz_app/domain/news/entity/news.entity.dart';
import 'package:newz_app/domain/news/repo/news.repository.dart';

class GetTopHeadlinesNewsUseCase {
  final NewsRepository newsRepository;

  GetTopHeadlinesNewsUseCase({ required this.newsRepository});

  Future<Either<List<NewsEntity>, Failure>> invoke() async {
    return await newsRepository.topHeadlines();
  }
}