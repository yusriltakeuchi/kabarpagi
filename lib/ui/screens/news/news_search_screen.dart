// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabarpagi/core/providers/news/news_provider.dart';
import 'package:kabarpagi/core/utils/navigation/navigation_utils.dart';
import 'package:kabarpagi/gen/assets.gen.dart';
import 'package:kabarpagi/ui/constant/constant.dart';
import 'package:kabarpagi/ui/constant/themes.dart';
import 'package:kabarpagi/ui/router/route_list.dart';
import 'package:kabarpagi/ui/widgets/idle/idle_item.dart';
import 'package:kabarpagi/ui/widgets/idle/loading/loading_listview.dart';
import 'package:kabarpagi/ui/widgets/news/news_item.dart';
import 'package:kabarpagi/ui/widgets/search/search_item.dart';

class NewsSearchScreen extends ConsumerStatefulWidget {
  const NewsSearchScreen({super.key});

  @override
  ConsumerState<NewsSearchScreen> createState() => _NewsSearchScreenState();
}

class _NewsSearchScreenState extends ConsumerState<NewsSearchScreen> {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: isDarkTheme(context) ? blackGrayColor : Colors.white,
        title: _searchWidget(),
      ),
      body: const NewsSearchBody(),
    );
  }

  Widget _searchWidget() {
    return SearchItem(
      controller: searchController,
      autoFocus: true,
      onSubmit: (value) {
        if (searchController.text.isNotEmpty) {
          ref.refresh(newsSearchProvider);
          ref.read(newsSearchProvider.notifier).search(searchController.text);
        }
      }
    );
  }
}

class NewsSearchBody extends ConsumerWidget {
  const NewsSearchBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsRef = ref.watch(newsSearchProvider);

    if (newsRef.isLoading == false && newsRef.reachedMax == false) {
      return IdleNoItemCenter(
        title: "Mau cari berita apa hari ini?",
        iconPath: Assets.images.illustrationSearch.path,
        color: isDarkTheme(context) ? Colors.white : blackColor,
      );
    }

    if (newsRef.isLoading && newsRef.items.isEmpty) {
      return const LoadingListView();
    }

    if (newsRef.items.isEmpty) {
      return IdleNoItemCenter(
        title: "Berita yang Anda cari tidak ditemukan",
        iconPath: Assets.images.illustrationNotfound.path,
        color: isDarkTheme(context) ? Colors.white : blackColor,
      );
    }

    bool loadNewPage = newsRef.isLoading && newsRef.items.isNotEmpty;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: newsRef.items.length,
      itemBuilder: (context, index) {
        final item = newsRef.items[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NewsItem(
              news: item,
              onClick: () => navigate.pushTo(routeNewsDetail, data: item),
            ),
            loadNewPage && index == newsRef.items.length - 1
              ? const LoadingListView()
              : const SizedBox(),
          ],
        );
      },
    );
  }
}