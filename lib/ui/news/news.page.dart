import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newz_app/domain/news/entity/news.entity.dart';
import 'package:newz_app/ui/news/bloc/news.bloc.dart';
import 'package:newz_app/ui/news/bloc/news.event.dart';
import 'package:newz_app/ui/news/bloc/news.state.dart';
import 'package:newz_app/ui/news/component/news_item.component.dart';
import 'package:newz_app/ui/read/read.page.dart';

class NewsPage extends StatefulWidget {
  final NewsBloc newsBloc;
  const NewsPage({Key? key, required this.newsBloc}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final List<NewsEntity> _articles = [];
  bool _isLoading = false;

  _fetchNews() {
    widget.newsBloc.add(NewsEventGetTopHeadlines());
  }

  _handleState(state) {
    if (state is NewsStateLoading) {
      _isLoading = state.isLoading;
    } else if (state is NewsStateTopHeadlines) {
      _articles.clear();
      _articles.addAll(state.news);
    } else if (state is NewsStateError) {
      Fluttertoast.showToast(
        msg: state.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  @override
  void initState() {
    _fetchNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Top Headlines"),
        ),
        body: BlocConsumer<NewsBloc, NewsState>(
          bloc: widget.newsBloc,
          listener: (context, state) {
            _handleState(state);
          },
          builder: (context, state) {
            return _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: _articles.length,
                    itemBuilder: (ctx, index) {
                      return NewsItem(
                        newsEntity: _articles[index],
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ReadPage(newsEntity: _articles[index])))
                        },
                      );
                    });
          },
        ));
  }
}
