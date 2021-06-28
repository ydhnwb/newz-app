abstract class Serializable {
  Map<String, dynamic> toJson();
}

class ErrorResponse <T extends Serializable> {
  String code;
  String message;

  ErrorResponse({ required this.code, required this.message });

  factory ErrorResponse.fronJson(Map<String, dynamic> json) {
    return ErrorResponse(code: json["code"], message: json["message"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "code": this.code,
      "message": this.message
    };
  }


}