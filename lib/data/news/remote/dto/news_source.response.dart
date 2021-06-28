import 'package:newz_app/data/common/response/wrapped.resppnse.dart';

class NewsSourceResponse implements Serializable {
  String? id;
  String? name;

  NewsSourceResponse({ this.id, this.name });

  factory NewsSourceResponse.fromJson(Map<String, dynamic> json) {
    return NewsSourceResponse(id: json["id"] != Null ? json["id"] : null, name: json["name"]);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "id" : this.id,
      "name": this.name
    };
  }

}
