

import 'package:dio/dio.dart';
import 'package:kabarpagi/core/data/base_api.dart';
import 'package:kabarpagi/core/models/api/api_response.dart';
import 'package:kabarpagi/core/models/api/api_result_model.dart';
import 'package:kabarpagi/core/models/news/news_model.dart';

class SourceService {
  BaseAPI api;
  CancelToken cancelToken;
  SourceService(this.api, this.cancelToken);

  Future<ApiResultList<NewsSourceModel>> getSources({Map<String, dynamic>? param}) async {
    APIResponse response = await api.get(
      api.endpoint.getSources,
      param: param,
      cancelToken: cancelToken
    );
    return ApiResultList<NewsSourceModel>.fromJson(response.data, (data) 
      => data.map((e) => NewsSourceModel.fromJson(e)).toList(), field: "sources");
  }
}