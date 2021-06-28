import 'package:dartz/dartz.dart';
import 'package:newz_app/data/news/remote/api/news_api.dart';
import 'package:newz_app/domain/common/base/base_exception.dart';
import 'package:newz_app/domain/news/entity/news.entity.dart';
import 'package:newz_app/domain/common/base/base_failure.dart';
import 'package:newz_app/domain/news/repo/news.repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsApi newsApi;

  NewsRepositoryImpl({required this.newsApi});

  @override
  Future<Either<List<NewsEntity>, Failure>> topHeadlines() async {
    try{
      var result = await newsApi.topHeadlines();
      return Left(result);
    } on ServerException catch(e){
      return Right(ServerFailure(message: "${e.message} [${e.code}]"));
    }
  }
}