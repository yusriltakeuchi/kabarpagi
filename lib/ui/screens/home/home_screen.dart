import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabarpagi/core/providers/news/news_provider.dart';
import 'package:kabarpagi/core/utils/formatter/date_format_utils.dart';
import 'package:kabarpagi/core/utils/navigation/navigation_utils.dart';
import 'package:kabarpagi/gen/assets.gen.dart';
import 'package:kabarpagi/ui/constant/constant.dart';
import 'package:kabarpagi/ui/router/route_list.dart';
import 'package:kabarpagi/ui/screens/home/items/home_headline_item.dart';
import 'package:kabarpagi/ui/widgets/idle/idle_item.dart';
import 'package:kabarpagi/ui/widgets/idle/loading/loading_listview.dart';
import 'package:kabarpagi/ui/widgets/news/news_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Row(
          children: [
            Assets.icons.iconGlobe.svg(
              width: setWidth(60),
              height: setHeight(60),
              color: primaryColor
            ),
            SizedBox(
              width: setWidth(20),
            ),
            Text(
              "Kabar Pagi",
              style: styleTitle.copyWith(
                color: blackColor,
                fontSize: setFontSize(55),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: setWidth(60),
            ),
            child: Assets.icons.iconSearch.svg(
              width: setWidth(40),
              height: setHeight(40),
              color: blackColor
            ),
          )
        ],
      ),
      body: const HomeBody(),
    );
  }
}

class HomeBody extends ConsumerStatefulWidget {
  const HomeBody({super.key});

  @override
  ConsumerState<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends ConsumerState<HomeBody> {
  ScrollController? scrollController;
  _scrollListener() {
    if (scrollController!.offset >=
            scrollController!.position.maxScrollExtent &&
        !scrollController!.position.outOfRange) {
        /// Fetch new data news
        final newsRef = ref.watch(newsProvider);
        if (newsRef.reachedMax == false) {
          ref.read(newsProvider.notifier).loadMore();
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
    return RefreshIndicator(
      onRefresh: () async => ref.refresh(newsProvider),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: setHeight(40),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: setWidth(30)
              ),
              child: Text(
                formatterDateNormal2.format(DateTime.now()),
                style: styleSubtitle.copyWith(
                  fontSize: setFontSize(35),
                  color: grayColor
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: setWidth(30)
              ),
              child: Text(
                "Halo, Selamat Pagi Yusril",
                style: styleTitle.copyWith(
                  fontSize: setFontSize(50),
                  color: blackColor
                ),
              ),
            ),
            SizedBox(
              height: setHeight(50),
            ),
            const HomeHeadlineItem(),
            SizedBox(
              height: setHeight(50),
            ),
            _newsHeader(),
          ],
        ),
      ),
    );
  }

  Widget _newsHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: setWidth(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hanya Untukmu",
                style: styleTitle.copyWith(
                  fontSize: setFontSize(50),
                ),
              ),
              Text(
                "Lihat Semua",
                style: styleSubtitle.copyWith(
                  fontSize: setFontSize(35),
                  color: primaryColor,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: setHeight(20),
        ),
        _newsList()
      ],
    );
  }

  Widget _newsList() {
    final newsRef = ref.watch(newsProvider);
    if (newsRef.isLoading && newsRef.items.isEmpty) {
      return const LoadingListView();
    }

    if (newsRef.items.isEmpty) {
      return const IdleNoItemCenter(
        title: "Tidak ada berita",
      );
    }

    bool loadNewPage = newsRef.isLoading && newsRef.items.isNotEmpty;
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
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
