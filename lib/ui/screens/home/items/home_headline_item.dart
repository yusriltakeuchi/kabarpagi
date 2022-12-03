import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabarpagi/core/providers/news/news_provider.dart';
import 'package:kabarpagi/core/utils/navigation/navigation_utils.dart';
import 'package:kabarpagi/ui/constant/constant.dart';
import 'package:kabarpagi/ui/router/route_list.dart';
import 'package:kabarpagi/ui/widgets/idle/loading/loading_singlebox.dart';
import 'package:kabarpagi/ui/widgets/news/news_headline_item.dart';

class HomeHeadlineItem extends ConsumerStatefulWidget {
  const HomeHeadlineItem({super.key});

  @override
  ConsumerState<HomeHeadlineItem> createState() => _HomeHeadlineItemState();
}

class _HomeHeadlineItemState extends ConsumerState<HomeHeadlineItem> {
  var carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final newsRef = ref.watch(newsHeadlinesProvider);
    if (newsRef.isLoading && newsRef.items.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: setWidth(30)
        ),
        child: const LoadingSingleBox(),
      );
    }

    if (newsRef.items.isEmpty) {
      return const SizedBox();
    }
    
    return CarouselSlider.builder(
      carouselController: carouselController,
      itemCount: newsRef.items.length, 
      options: CarouselOptions(
        aspectRatio: 2,
        height: setHeight(500),
        viewportFraction: 0.92,
        enableInfiniteScroll: false,
        autoPlay: false,
      ),
      itemBuilder: (context, index, _) {

        return Padding(
          padding: EdgeInsets.only(
            right: setWidth(30)
          ),
          child: NewsHeadLineItem(
            news: newsRef.items[index],
            onClick: () => navigate.pushTo(routeNewsDetail, data: newsRef.items[index]),
          ),
        );
      },
    );
  }
}