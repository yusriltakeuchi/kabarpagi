// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabarpagi/core/providers/news/news_provider.dart';
import 'package:kabarpagi/core/providers/source/source_provider.dart';
import 'package:kabarpagi/core/utils/formatter/date_format_utils.dart';
import 'package:kabarpagi/core/utils/navigation/navigation_utils.dart';
import 'package:kabarpagi/gen/assets.gen.dart';
import 'package:kabarpagi/ui/constant/constant.dart';
import 'package:kabarpagi/ui/constant/themes.dart';
import 'package:kabarpagi/ui/router/route_list.dart';
import 'package:kabarpagi/ui/screens/home/items/home_headline_item.dart';
import 'package:kabarpagi/ui/widgets/chip/chip_item.dart';
import 'package:kabarpagi/ui/widgets/idle/idle_item.dart';
import 'package:kabarpagi/ui/widgets/idle/loading/loading_listview.dart';
import 'package:kabarpagi/ui/widgets/idle/loading/loading_singlebox.dart';
import 'package:kabarpagi/ui/widgets/news/news_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkTheme(context) ? blackGrayColor : Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Row(
          children: [
            Assets.icons.iconMorning.svg(
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
                color: isDarkTheme(context) ? Colors.white : blackColor,
                fontSize: setFontSize(55),
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () => navigate.pushTo(routeNewsSearch),
            child: Padding(
              padding: EdgeInsets.only(
                right: setWidth(20),
              ),
              child: Assets.icons.iconSearch.svg(
                width: setWidth(40),
                height: setHeight(40),
                color: isDarkTheme(context) ? Colors.white : blackColor
              ),
            ),
          ),
          GestureDetector(
            onTap: () => navigate.pushTo(routeSetting),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: setWidth(60),
              ),
              child: Assets.icons.iconSetting.svg(
                width: setWidth(40),
                height: setHeight(40),
                color: isDarkTheme(context) ? Colors.white : blackColor
              ),
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
      onRefresh: () async {
        ref.refresh(newsProvider);
        ref.refresh(newsHeadlinesProvider);
        ref.refresh(sourceProvider);
      },
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
                  color: isDarkTheme(context) ? Colors.white : blackColor
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
            children: [
              Assets.icons.iconGlobe.svg(
                width: setWidth(50),
                height: setHeight(50),
                color: primaryColor
              ),
              SizedBox(
                width: setWidth(15),
              ),
              Text(
                "Berita Internasional",
                style: styleTitle.copyWith(
                  fontSize: setFontSize(45),
                  color: isDarkTheme(context) ? Colors.white : blackColor
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: setHeight(20),
        ),
        _sourceWidget(),
        SizedBox(
          height: setHeight(50),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: setWidth(30),
          ),
          child: Row(
            children: [
              Assets.icons.iconNews.svg(
                width: setWidth(50),
                height: setHeight(50),
                color: primaryColor
              ),
              SizedBox(
                width: setWidth(15),
              ),
              Text(
                "Terbaru",
                style: styleTitle.copyWith(
                  fontSize: setFontSize(45),
                  color: isDarkTheme(context) ? Colors.white : blackColor
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: setHeight(10),
        ),
        _newsList()
      ],
    );
  }

  Widget _sourceWidget() {
    final sourceRef = ref.watch(sourceProvider);
    if (sourceRef.isLoading && sourceRef.items.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: setWidth(30)
        ),
        child: const LoadingSingleBox(
          height: 80,
        ),
      );
    }

    if (sourceRef.items.isEmpty) {
      return const SizedBox();
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: sourceRef.items.asMap().map((index, value) => MapEntry(index, Padding(
          padding: EdgeInsets.only(
            left: index == 0 ? setWidth(30) : 0,
            right: setWidth(30)
          ),
          child: ChipItem(
            name: value.name ?? "",
            onClick: () => navigate.pushTo(routeNewsSource, data: value),
          ),
        ))).values.toList(),
      ),
    );
  }

  Widget _newsList() {
    final newsRef = ref.watch(newsProvider);
    if (newsRef.isLoading && newsRef.items.isEmpty) {
      return const LoadingListView();
    }

    if (newsRef.items.isEmpty) {
      return IdleNoItemCenter(
        title: "Tidak ada berita",
        color: isDarkTheme(context) ? Colors.white : blackColor,
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
