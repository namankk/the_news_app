import 'package:equatable/equatable.dart';
import 'package:the_news_app/features/news_app_basic_feature/domain/entities/article_entities.dart';

abstract class LatestNewsListStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class LatestNewsListEmpty extends LatestNewsListStates {}

class LatestNewsListLoading extends LatestNewsListStates {}

class LatestNewsListError extends LatestNewsListStates {
  final String _message;

  LatestNewsListError(this._message);

  @override
  List<Object?> get props => [_message];
}

class LatestNewsListHasData extends LatestNewsListStates {
  final List<ArticleEntities> _result;

  LatestNewsListHasData(this._result);
  List<ArticleEntities> get result =>_result;

  @override
  List<Object?> get props => [_result];
}
