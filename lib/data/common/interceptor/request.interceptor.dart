import 'package:dio/dio.dart';

class RequestInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    const String apiKey = "92325dd85b0749f58655163f3207ddfd";
    const String countryCode = "id";
    options.queryParameters["country"] = countryCode;
    options.queryParameters["apiKey"] = apiKey;
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print("=== Dio Error Occured ===");
    print(err.message);
    // consider to remap this error to generic error.
    return super.onError(err, handler);

  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }

}