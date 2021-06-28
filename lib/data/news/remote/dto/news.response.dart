import 'package:newz_app/data/common/response/wrapped.resppnse.dart';
import 'package:newz_app/data/news/remote/dto/news_source.response.dart';

class NewsResponse implements Serializable {
  NewsSourceResponse source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;


  NewsResponse({ 
    required this.source, 
    required this.author, 
    required this.title, 
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content
    
  });


  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      source: NewsSourceResponse.fromJson(json["source"]),
      author: json["author"] != Null ? json["author"] : null,
      title: json["title"] != Null ? json["title"] : null,
      description: json["description"] != Null ? json["description"] : null,
      url: json["url"] != Null ? json["url"] : null,
      urlToImage: json["urlToImage"] != Null ? json["urlToImage"] : null,
      publishedAt: json["publishedAt"] != Null ? json["publishedAt"] : null,
      content: json["content"] != Null ? json["content"] : null
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
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

}
