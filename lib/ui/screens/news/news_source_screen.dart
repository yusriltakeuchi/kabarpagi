import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kabarpagi/core/models/news/news_model.dart';
import 'package:kabarpagi/core/providers/news/news_provider.dart';
import 'package:kabarpagi/core/utils/navigation/navigation_utils.dart';
import 'package:kabarpagi/gen/assets.gen.dart';
import 'package:kabarpagi/ui/constant/constant.dart';
import 'package:kabarpagi/ui/constant/themes.dart';
import 'package:kabarpagi/ui/router/route_list.dart';
import 'package:kabarpagi/ui/widgets/idle/idle_item.dart';
import 'package:kabarpagi/ui/widgets/idle/loading/loading_listview.dart';
import 'package:kabarpagi/ui/widgets/news/news_item.dart';

class NewsSourceScreen extends StatelessWidget {
  final NewsSourceModel source;
  const NewsSourceScreen({
    Key? key,
    required this.source,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkTheme(context) ? blackGrayColor : Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Text(
          source.name ?? "",
          style: styleTitle.copyWith(
            color: isDarkTheme(context) ? Colors.white : blackColor,
            fontSize: setFontSize(55),
          ),
        ),
      ),
      body: NewsSourceBody(
        source: source,
      ),
    );
  }
}

class NewsSourceBody extends ConsumerStatefulWidget {
  final NewsSourceModel source;
  const NewsSourceBody({
    Key? key,
    required this.source,
  }) : super(key: key);

  @override
  ConsumerState<NewsSourceBody> createState() => _NewsSourceBodyState();
}

class _NewsSourceBodyState extends ConsumerState<NewsSourceBody> {
  ScrollController? scrollController;
  _scrollListener() {
    if (scrollController!.offset >=
            scrollController!.position.maxScrollExtent &&
        !scrollController!.position.outOfRange) {
        /// Fetch new data news
        final newsRef = ref.watch(newsSourceProvider(widget.source.id!));
        if (newsRef.reachedMax == false) {
          ref.read(newsSourceProvider(widget.source.id!).notifier).loadMore();
        }
    }
  }
  
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController?.addListener(_scrollListener);
  }
  @override
  Widget build(BuildContext context) {
    final newsRef = ref.watch(newsSourceProvider(widget.source.id ?? ""));
    if (newsRef.isLoading && newsRef.items.isEmpty) {
      return const LoadingListView();
    }

    if (newsRef.items.isEmpty) {
      return IdleNoItemCenter(
        title: "Berita tidak ditemukan",
        iconPath: Assets.images.illustrationNotfound.path,
        color: isDarkTheme(context) ? Colors.white : blackColor,
      );
    }

    bool loadNewPage = newsRef.isLoading && newsRef.items.isNotEmpty;
    return RefreshIndicator(
      onRefresh: () async => ref.refresh(newsSourceProvider(widget.source.id!)),
      child: ListView.builder(
        shrinkWrap: true,
        controller: scrollController,
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
      ),
    );
  }
}
