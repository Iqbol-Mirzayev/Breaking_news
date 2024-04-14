import 'package:nimadir/core/resources/data_state.dart';
import 'package:nimadir/features/daily_news/domain/entities/article.dart';
import 'package:nimadir/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles() {
    throw UnimplementedError();
  }
}
