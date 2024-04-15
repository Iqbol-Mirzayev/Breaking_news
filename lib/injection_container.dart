import 'package:get_it/get_it.dart';
import 'package:nimadir/features/daily_news/data/data_sources/remote/news_api_service.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:nimadir/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:nimadir/features/daily_news/domain/repository/article_repository.dart';
import 'package:nimadir/features/daily_news/domain/usecases/get_article.dart';
import 'package:nimadir/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
// DIO
  sl.registerSingleton<Dio>(Dio());

// Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

// Usecases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

// Blocs
  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
}
