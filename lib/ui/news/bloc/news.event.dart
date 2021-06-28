import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable{}

class NewsEventGetTopHeadlines implements NewsEvent {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;

}