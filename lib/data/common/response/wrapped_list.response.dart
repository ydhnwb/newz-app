import 'package:newz_app/data/common/response/wrapped.resppnse.dart';

class WrappedListResponse <T extends Serializable> {
  String status;
  int totalResults;
  List<T>? articles;

  WrappedListResponse({ required this.status, required this.totalResults, required this.articles });

  factory WrappedListResponse.fromJson(Map<String, dynamic> json, Function(List<dynamic>) create){
    return WrappedListResponse<T>(status: json["status"], totalResults: json["totalResults"], articles: create(json["articles"]));
  }

  Map<String, dynamic> toJson() {
    return {
      "status": this.status,
      "totalResults": this.totalResults,
      "articles": []
    };
  }
}