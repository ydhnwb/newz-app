
abstract class Serializable {
  Map<String, dynamic> toJson();
}

class WrappedResponse <T extends Serializable> {
  String status;
  int totalResults;
  T? data;

  WrappedResponse({ required this.status, required this.totalResults, required this.data });

  factory WrappedResponse.fromJson(Map<String, dynamic> json, Function(Map<String, dynamic>) create){
    return WrappedResponse<T>(status: json["status"], totalResults: json["totalResults"], data: create(json["data"]));
  }

  Map<String, dynamic> toJson() {
    return {
      "status": this.status,
      "totalResults": this.totalResults,
      "data": this.data?.toJson()
    };
  }

}