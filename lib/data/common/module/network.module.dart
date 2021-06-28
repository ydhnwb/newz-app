import 'package:dio/dio.dart';
import 'package:newz_app/data/common/interceptor/request.interceptor.dart';

class NetworkModule {
  final Dio _dio = new Dio();
  final String _baseUrl = "https://newsapi.org/";
  final RequestInterceptor requestInterceptor;

  NetworkModule({required this.requestInterceptor});

  BaseOptions _dioOptions(){
    BaseOptions opts = BaseOptions();
    opts.baseUrl = _baseUrl;
    opts.connectTimeout = 60000;
    opts.receiveTimeout = 60000;
    opts.sendTimeout = 60000;
    return opts;
  }


  Dio provideDio(){
    _dio.options = _dioOptions();
    _dio.interceptors.add(requestInterceptor);
    return _dio;
  }
}