import 'package:equatable/equatable.dart';
import 'package:newz_app/domain/news/entity/news.entity.dart';

abstract class NewsState extends Equatable{}

class NewsStateInit implements NewsState{
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;

}

class NewsStateLoading implements NewsState{
  final bool isLoading;

  NewsStateLoading({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];

  @override
  bool? get stringify => false;

}

class NewsStateTopHeadlines implements NewsState {
  final List<NewsEntity> news;

  NewsStateTopHeadlines({required this.news});

  @override
  List<Object?> get props => [news];

  @override
  bool? get stringify => false;

}

class NewsStateError implements NewsState {
  final String message;

  NewsStateError({  required this.message });

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => false;

}