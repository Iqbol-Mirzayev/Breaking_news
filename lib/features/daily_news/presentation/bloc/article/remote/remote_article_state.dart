import 'package:equatable/equatable.dart';
import 'package:nimadir/features/daily_news/domain/entities/article.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  // ignore: deprecated_member_use
  final DioError? error;

  const RemoteArticleState({this.articles, this.error});

  @override
  List<Object> get props => [articles!, error!];
}

class RemoteArticlesLoading extends RemoteArticleState {
  const RemoteArticlesLoading();
}

class RemoteArticlesDone extends RemoteArticleState {
  const RemoteArticlesDone(List<ArticleEntity> article)
      : super(articles: article);
}

class RemoteArticlesError extends RemoteArticleState {
  // ignore: deprecated_member_use
  const RemoteArticlesError(DioError error) : super(error: error);
}
