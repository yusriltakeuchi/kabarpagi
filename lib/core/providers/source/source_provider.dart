

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabarpagi/core/data/base_api.dart';
import 'package:kabarpagi/core/models/news/news_model.dart';
import 'package:kabarpagi/core/models/state/list_state.dart';
import 'package:kabarpagi/core/services/source/source_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'source_provider.g.dart';

/// Creating source service with code generations
@riverpod
SourceService sourceService(SourceServiceRef ref, {required CancelToken cancelToken}) 
  => SourceService(BaseAPI(), cancelToken);
/// ---------------------

/// Creating source provider
final sourceProvider = StateNotifierProvider.autoDispose<SourceNotifier, ListState<NewsSourceModel>>((ref) {
  final cancelToken = CancelToken();
  ref.onDispose(() => cancelToken.cancel());
  return SourceNotifier(ref.watch(sourceServiceProvider(cancelToken: cancelToken)));
});
/// ---------------------

/// Creating source notifier
class SourceNotifier extends StateNotifier<ListState<NewsSourceModel>> {
  SourceService sourceService;
  SourceNotifier(this.sourceService) : super(ListState<NewsSourceModel>(items: [])) {
    getSources();
  }

  Future<void> getSources() async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await sourceService.getSources();
      state = state.copyWith(items: result.data!, isLoading: false);
    } catch (e) {
      if (mounted) state = state.copyWith(isLoading: false);
    }
  }
}
/// ---------------------
