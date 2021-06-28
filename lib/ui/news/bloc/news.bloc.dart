import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newz_app/domain/news/usecase/get_top_headlines_news.usecase.dart';
import 'package:newz_app/ui/news/bloc/news.event.dart';
import 'package:newz_app/ui/news/bloc/news.state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetTopHeadlinesNewsUseCase getTopHeadlinesNewsUseCase;

  NewsBloc({required this.getTopHeadlinesNewsUseCase}) : super(NewsStateInit());


  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if(event is NewsEventGetTopHeadlines){
      yield* _getTopHeadlines();
    }
  }

  Stream<NewsState> _setIsLoading(bool isLoading) async* {
    yield NewsStateLoading(isLoading: isLoading);
  }

  Stream<NewsState> _getTopHeadlines() async* {
    yield* _setIsLoading(true);
    var res = await getTopHeadlinesNewsUseCase.invoke();
    yield* _setIsLoading(false);
    yield* res.fold(
      (l) async* {
        yield NewsStateTopHeadlines(news: l);
      }, 
      (r) async* {
        print("ashiap");
        yield NewsStateError(message: r.message);
      }
    );
  }

}