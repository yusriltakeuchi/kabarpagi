import 'package:flutter/material.dart';

import 'package:kabarpagi/core/models/news/news_model.dart';
import 'package:kabarpagi/core/utils/navigation/navigation_utils.dart';
import 'package:kabarpagi/gen/assets.gen.dart';
import 'package:kabarpagi/ui/constant/constant.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsModel? news;
  const NewsDetailScreen({
    Key? key,
    required this.news,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NewsDetailBody(
        news: news,
      ),
    );
  }
}

class NewsDetailBody extends StatefulWidget {
  final NewsModel? news;
  const NewsDetailBody({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  State<NewsDetailBody> createState() => _NewsDetailBodyState();
}

class _NewsDetailBodyState extends State<NewsDetailBody> {
  ScrollController? scrollController;
  bool reachedTop = true;
  _scrollListener() {
    if (scrollController!.offset >= 100 && reachedTop) {
      setState(() {
        reachedTop = false;
      });
    } else if (scrollController!.offset < 100 && !reachedTop) {
      setState(() {
        reachedTop = true;
      });
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
    return NestedScrollView(
      controller: scrollController,
      body: NewsDetailContent(news: widget.news,),
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        
        return <Widget>[
          SliverAppBar(
            elevation: 0,
            expandedHeight: deviceHeight * 0.3,
            floating: false,
            pinned: true,
            title: Text(
              reachedTop 
                ? ""
                :  widget.news?.title ?? "",
              style: styleTitle.copyWith(
                fontSize: setFontSize(45),
                color: blackColor,
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: grayColor.withOpacity(0.4),
                    width: 1
                  ),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Material(
                  type: MaterialType.transparency,
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => navigate.pop(),
                    borderRadius: BorderRadius.circular(12),
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      color: blackColor,
                    ),
                  ),
                ),
              ),
            ),
            flexibleSpace: _flexibleSpace(),
            backgroundColor: Colors.white,
          )
        ];
      }
    );
  }

  Widget _flexibleSpace() {
    return FlexibleSpaceBar(
      centerTitle: true,
      collapseMode: CollapseMode.pin,
      background: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.network(
              widget.news?.urlImage ?? "",
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            bottom: -3,
            left: 0,
            right: 0,
            child: Container(
              height: setHeight(80),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
              ),
              child: Center(
                child: Container(
                  width: deviceWidth * 0.12,
                  height: setHeight(15),
                  decoration: BoxDecoration(
                    color: grayColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(42)
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewsDetailContent extends StatelessWidget {
  final NewsModel? news;
  const NewsDetailContent({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: setWidth(40),
        vertical: setHeight(30)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: grayColor.withOpacity(0.2)
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: setWidth(40),
                vertical: setHeight(10)
              ),
              child: Text(
                news?.source?.name ?? "",
                style: styleSubtitle.copyWith(
                  color: blackColor,
                  fontSize: setFontSize(30)
                ),
              ),
            ),
          ),
          SizedBox(
            height: setHeight(30),
          ),
          Text(
            news?.title ?? "",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: styleTitle.copyWith(
              fontSize: setFontSize(55),
              color: blackColor
            ),
          ),
          SizedBox(
            height: setHeight(30),
          ),
          Row(
            children: [
              Assets.icons.iconUser.svg(
                width: setWidth(60),
                height: setHeight(60),
                color: blackColor,
              ),
              SizedBox(
                width: setWidth(20),
              ),
              Text(
                news!.author!.isEmpty ? "Unknown" : news!.author!,
                style: styleSubtitle.copyWith(
                  fontSize: setFontSize(35),
                  color: blackColor,
                ),
              )
            ],
          ),
          SizedBox(
            height: setHeight(25),
          ),
          Divider(
            color: blackColor.withOpacity(0.2),
          ),
          SizedBox(
            height: setHeight(25),
          ),
          Text(
            news?.content ?? "",
            style: styleSubtitle.copyWith(
              fontSize: setFontSize(40),
              color: blackColor
            ),
          )
        ],
      ),
    );
  }
}
