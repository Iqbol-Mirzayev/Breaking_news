import 'dart:io';
import 'package:dio/dio.dart';
import 'package:nimadir/core/constants/constants.dart';
import 'package:nimadir/core/resources/data_state.dart';
import 'package:nimadir/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:nimadir/features/daily_news/domain/entities/article.dart';
import 'package:nimadir/features/daily_news/domain/repository/article_repository.dart';
// import 'package:retrofit/retrofit.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsApiKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        // ignore: deprecated_member_use
        return DataFailed(DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          // ignore: deprecated_member_use
          type: DioErrorType.badResponse, //!    =>  response
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
