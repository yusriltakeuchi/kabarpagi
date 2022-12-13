
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabarpagi/core/data/base_api.dart';
import 'package:kabarpagi/core/models/filter/news/filter_news_model.dart';
import 'package:kabarpagi/core/models/news/news_model.dart';
import 'package:kabarpagi/core/models/state/list_state.dart';
import 'package:kabarpagi/core/services/news/news_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_provider.g.dart';

/// Creating news services with code generations
@riverpod
NewsService newsService(NewsServiceRef ref, {required CancelToken cancelToken}) 
  => NewsService(BaseAPI(), cancelToken);
/// --------------------

/// Creating news provider
final newsProvider = StateNotifierProvider.autoDispose<NewsNotifier, ListState<NewsModel>>((ref) {
  final cancelToken = CancelToken();
  ref.onDispose(() => cancelToken.cancel());
  return NewsNotifier(ref.watch(newsServiceProvider(cancelToken: cancelToken)));
});
final newsHeadlinesProvider = StateNotifierProvider.autoDispose<NewsHeadLineNotifier, ListState<NewsModel>>((ref) {
  final cancelToken = CancelToken();
  ref.onDispose(() => cancelToken.cancel());
  return NewsHeadLineNotifier(ref.watch(newsServiceProvider(cancelToken: cancelToken)));
});
final newsSearchProvider = StateNotifierProvider.autoDispose<NewsSearchNotifier, ListState<NewsModel>>((ref) {
  final cancelToken = CancelToken();
  ref.onDispose(() => cancelToken.cancel());
  return NewsSearchNotifier(ref.watch(newsServiceProvider(cancelToken: cancelToken)));
});
final newsSourceProvider = StateNotifierProvider.autoDispose.family<NewsSourceNotifier, ListState<NewsModel>, String>((ref, sourceId) {
  final cancelToken = CancelToken();
  ref.onDispose(() => cancelToken.cancel());
  return NewsSourceNotifier(ref.watch(newsServiceProvider(cancelToken: cancelToken)), sourceId);
});
/// --------------------


/// Creating news notifier
class NewsNotifier extends StateNotifier<ListState<NewsModel>> {
  NewsService newsService;
  NewsNotifier(this.newsService) : super(ListState<NewsModel>(items: [])) {
    getNews();
  }

  Future<void> getNews() async {
    state = state.copyWith(isLoading: true);
    try {
      var filter = FilterNewsModel();
      filter.page = state.page;
      filter.perPage = 10;
      filter.country = "id";
      
      final result = await newsService.getNews(param: filter.toJson());
      state = state.copyWith(items: result.data!, isLoading: false);
    } catch (e) {
      if (mounted) state = state.copyWith(isLoading: false);
    }
  }

  Future<void> loadMore() async {
    state = state.copyWith(isLoading: true);
    try {
      var filter = FilterNewsModel();
      filter.page = state.page + 1;
      filter.perPage = 10;
      filter.country = "id";

      final result = await newsService.getNews(param: filter.toJson());
      /// If reached max page then set reachedMax to true
      if (result.data!.isNotEmpty) {
        state = state.copyWith(items: state.items + result.data!, isLoading: false, page: state.page + 1);
      } else {
        state = state.copyWith(isLoading: false, reachedMax: true, items: state.items);
      }
    } catch (e) {
      if (mounted) state = state.copyWith(isLoading: false, items: state.items);
    }
  }
}


/// Creating news headline notifier
class NewsHeadLineNotifier extends StateNotifier<ListState<NewsModel>> {
  NewsService newsService;
  NewsHeadLineNotifier(this.newsService) : super(ListState<NewsModel>(items: [])) {
    getHeadLines();
  }

  Future<void> getHeadLines() async {
    state = state.copyWith(isLoading: true);
    try {
      var filter = FilterNewsModel();
      filter.page = state.page;
      filter.language = "id";
      filter.q = "teknologi";
      filter.sortBy = "popularity";
      filter.pageSize = 5;
      
      final result = await newsService.getHeadLines(param: filter.toJson());
      state = state.copyWith(items: result.data!, isLoading: false);
    } catch (e) {
      if (mounted) state = state.copyWith(isLoading: false);
    }
  }
}

/// Creating news search notifier
class NewsSearchNotifier extends StateNotifier<ListState<NewsModel>> {
  NewsService newsService;
  NewsSearchNotifier(this.newsService) : super(ListState<NewsModel>(items: []));

  Future<void> search(String keyword) async {
    state = state.copyWith(isLoading: true);
    try {
      var filter = FilterNewsModel();
      filter.page = state.page;
      filter.language = "id";
      filter.q = keyword.toLowerCase().trim();
      
      final result = await newsService.getNews(param: filter.toJson());
      state = state.copyWith(items: result.data!, isLoading: false, reachedMax: true);
    } catch (e) {
      if (mounted) state = state.copyWith(isLoading: false);
    }
  }
}

/// Creating news source notifier
class NewsSourceNotifier extends StateNotifier<ListState<NewsModel>> {
  NewsService newsService;
  String sourceId;
  NewsSourceNotifier(this.newsService, this.sourceId) : super(ListState<NewsModel>(items: [])) {
    getNews();
  }

  Future<void> getNews() async {
    state = state.copyWith(isLoading: true);
    try {
      var filter = FilterNewsModel();
      filter.page = state.page;
      filter.perPage = 10;
      filter.sources = sourceId;
      
      final result = await newsService.getNews(param: filter.toJson());
      state = state.copyWith(items: result.data!, isLoading: false);
    } catch (e) {
      if (mounted) state = state.copyWith(isLoading: false);
    }
  }

  Future<void> loadMore() async {
    state = state.copyWith(isLoading: true);
    try {
      var filter = FilterNewsModel();
      filter.page = state.page + 1;
      filter.perPage = 10;
      filter.sources = sourceId;

      final result = await newsService.getNews(param: filter.toJson());
      /// If reached max page then set reachedMax to true
      if (result.data!.isNotEmpty) {
        state = state.copyWith(items: state.items + result.data!, isLoading: false, page: state.page + 1);
      } else {
        state = state.copyWith(isLoading: false, reachedMax: true, items: state.items);
      }
    } catch (e) {
      if (mounted) state = state.copyWith(isLoading: false, items: state.items);
    }
  }
}

/// --------------------