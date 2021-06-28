import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:newz_app/data/common/response/wrapped_list.response.dart';
import 'package:newz_app/data/news/remote/api/news_api.dart';
import 'package:newz_app/data/news/remote/dto/news.response.dart';
import 'package:newz_app/domain/common/base/base_exception.dart';
import 'package:newz_app/domain/news/entity/news.entity.dart';

class NewsApiImpl implements NewsApi {
  final Dio dio;

  NewsApiImpl({required this.dio});

  @override
  Future<List<NewsEntity>> topHeadlines() async{
    try{
      final response = await dio.get("v2/top-headlines");
      if(response.statusCode == 200){
        // print(response.data);
        var baseResponse = WrappedListResponse<NewsResponse>.fromJson(response.data, (data) {
          List<NewsResponse> news = data.map((e) => NewsResponse.fromJson(e)).toList();
          return news;
        });
        List<NewsEntity> news = [];
        baseResponse.articles?.forEach((element) {
          NewsEntity aNews = NewsEntity.toEntity(element);
          news.add(aNews);
        });
        return news;
      }
      throw ServerException(code: response.statusCode!, message: "Failed to fetch data");
    }on DioError catch(e) {
      throw ServerException(code: e.response?.statusCode == null ? -1 : e.response!.statusCode!, message: e.message.toString());
    }catch(e){
      throw ServerException(code: -1, message: e.toString());
    }
  }

}