import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:newz_app/data/common/interceptor/request.interceptor.dart';
import 'package:newz_app/data/common/module/network.module.dart';
import 'package:newz_app/data/news/remote/api/news_api.dart';
import 'package:newz_app/data/news/remote/api/news_api_impl.dart';
import 'package:newz_app/data/news/repo/news_repository_impl.dart';
import 'package:newz_app/domain/news/repo/news.repository.dart';
import 'package:newz_app/domain/news/usecase/get_top_headlines_news.usecase.dart';
import 'package:newz_app/ui/news/bloc/news.bloc.dart';
import 'package:newz_app/ui/news/news.page.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //interceptor
  sl.registerLazySingleton(() => RequestInterceptor());

  //module
  sl.registerLazySingleton<Dio>(
    () => NetworkModule(requestInterceptor: sl()).provideDio(),
  );

  //datasource
  sl.registerLazySingleton<NewsApi>(() => NewsApiImpl(dio: sl()));

  //repositories
  sl.registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImpl(newsApi: sl()));

  //use cases
  sl.registerLazySingleton(
      () => GetTopHeadlinesNewsUseCase(newsRepository: sl()));

  //blocs
  sl.registerFactory(() => NewsBloc(
        getTopHeadlinesNewsUseCase: sl(),
      ));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: sl.allReady(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: NewsPage(
              newsBloc: sl(),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
