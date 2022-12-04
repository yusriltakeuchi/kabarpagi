
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabarpagi/core/data/base_api.dart';
import 'package:kabarpagi/core/models/filter/news/filter_news_model.dart';
import 'package:kabarpagi/core/models/news/news_model.dart';
import 'package:kabarpagi/core/models/state/list_state.dart';
import 'package:kabarpagi/core/services/news/news_service.dart';

/// Creating news services
final newsService = Provider<NewsService>((ref) => NewsService(BaseAPI()));
/// --------------------

/// Creating news provider
final newsProvider = StateNotifierProvider.autoDispose<NewsNotifier, ListState<List<NewsModel>>>((ref) 
  => NewsNotifier(ref.watch(newsService)));
final newsHeadlinesProvider = StateNotifierProvider.autoDispose<NewsHeadLineNotifier, ListState<List<NewsModel>>>((ref) 
  => NewsHeadLineNotifier(ref.watch(newsService)));
final newsSearchProvider = StateNotifierProvider.autoDispose<NewsSearchNotifier, ListState<List<NewsModel>>>((ref) 
  => NewsSearchNotifier(ref.watch(newsService)));
/// --------------------


/// Creating news notifier
class NewsNotifier extends StateNotifier<ListState<List<NewsModel>>> {
  NewsService newsService;
  NewsNotifier(this.newsService) : super(ListState<List<NewsModel>>(items: [])) {
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
      state = state.copyWith(isLoading: false);
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
      state = state.copyWith(isLoading: false, items: state.items);
    }
  }
}


/// Creating news headline notifier
class NewsHeadLineNotifier extends StateNotifier<ListState<List<NewsModel>>> {
  NewsService newsService;
  NewsHeadLineNotifier(this.newsService) : super(ListState<List<NewsModel>>(items: [])) {
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
      state = state.copyWith(isLoading: false);
    }
  }
}

/// Creating news search notifier
class NewsSearchNotifier extends StateNotifier<ListState<List<NewsModel>>> {
  NewsService newsService;
  NewsSearchNotifier(this.newsService) : super(ListState<List<NewsModel>>(items: []));

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
      state = state.copyWith(isLoading: false);
    }
  }
}

/// --------------------