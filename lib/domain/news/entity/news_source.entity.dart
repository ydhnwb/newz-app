import 'package:newz_app/data/news/remote/dto/news_source.response.dart';

class NewsSourceEntity {
  String? id;
  String? name;

  NewsSourceEntity({
    required this.id, 
    required this.name, 
  });

  factory NewsSourceEntity.toEntity(NewsSourceResponse newsSourceResponse){
    return NewsSourceEntity(
      id: newsSourceResponse.id,
      name: newsSourceResponse.name,
    );
  }

  Map toJson() => {
      "id": this.id,
      "name": this.name,
  };

  
}