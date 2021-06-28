import 'package:newz_app/data/news/remote/dto/news.response.dart';
import 'package:newz_app/domain/news/entity/news_source.entity.dart';

class NewsEntity {
  NewsSourceEntity source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  NewsEntity({
    required this.source,
    required this.author, 
    required this.title, 
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content
    });

  factory NewsEntity.toEntity(NewsResponse newsResponse){
    return NewsEntity(
      source: NewsSourceEntity.toEntity(newsResponse.source),
      author: newsResponse.author,
      title: newsResponse.title,
      description: newsResponse.description,
      url: newsResponse.url,
      urlToImage: newsResponse.urlToImage,
      publishedAt: newsResponse.publishedAt,
      content: newsResponse.content
    );
  }

  Map toJson() => {
      "source": this.source.toJson(),
      "author": this.author,
      "title": this.title,
      "description": this.description,
      "url": this.url,
      "urlToImage": this.urlToImage,
      "publishedAt": this.publishedAt,
      "content": this.content
  };

  
}