import 'package:kabarpagi/core/data/base_api.dart';
import 'package:kabarpagi/core/models/api/api_response.dart';
import 'package:kabarpagi/core/models/api/api_result_model.dart';
import 'package:kabarpagi/core/models/news/news_model.dart';

class NewsService {
  BaseAPI api;
  NewsService(this.api);

  Future<ApiResultList<NewsModel>> getNews({Map<String, dynamic>? param}) async {
    APIResponse response = await api.get(
      api.endpoint.getHeadlinesNews,
      param: param,
    );
    return ApiResultList<NewsModel>.fromJson(response.data, (data) 
      => data.map((e) => NewsModel.fromJson(e)).toList(), field: "articles");
  }

  Future<ApiResultList<NewsModel>> getHeadLines({Map<String, dynamic>? param}) async {
    APIResponse response = await api.get(
      api.endpoint.getNews,
      param: param,
    );
    return ApiResultList<NewsModel>.fromJson(response.data, (data) 
      => data.map((e) => NewsModel.fromJson(e)).toList(), field: "articles");
  }
}