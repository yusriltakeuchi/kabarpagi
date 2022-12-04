import 'package:flutter/material.dart';

import 'package:kabarpagi/core/models/news/news_model.dart';
import 'package:kabarpagi/core/utils/formatter/date_format_utils.dart';
import 'package:kabarpagi/gen/assets.gen.dart';
import 'package:kabarpagi/ui/constant/constant.dart';
import 'package:kabarpagi/ui/constant/themes.dart';

class NewsItem extends StatelessWidget {
  final NewsModel? news;
  final VoidCallback onClick;
  const NewsItem({
    Key? key,
    required this.news,
    required this.onClick,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: setHeight(20),
          top: setHeight(20),
          left: setWidth(30),
          right: setWidth(30),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: grayColor.withOpacity(0.15)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: setWidth(40),
                        vertical: setHeight(10)
                      ),
                      child: Text(
                        news?.source?.name ?? "",
                        style: styleSubtitle.copyWith(
                          color: isDarkTheme(context) ? Colors.white : blackColor,
                          fontSize: setFontSize(30)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: setHeight(15),
                  ),
                  Text(
                    news?.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: styleTitle.copyWith(
                      fontSize: setFontSize(48),
                      color: isDarkTheme(context) ? Colors.white : blackColor
                    ),
                  ),
                  SizedBox(
                    height: setHeight(15),
                  ),
                  Text(
                    "${news!.author!.isNotEmpty ? news?.author : 'Unknown'} • ${formatterDateNormal.format(DateTime.parse(news!.publishedAt!))}",
                    style: styleSubtitle.copyWith(
                      fontSize: setFontSize(30),
                      color: grayDarkColor
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: setWidth(40),
            ),
            Hero(
              tag: news?.title ?? "",
              child: Container(
                width: setWidth(320),
                height: setHeight(300),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: news!.urlImage!.isNotEmpty
                    ? DecorationImage(
                        image: NetworkImage(
                          news?.urlImage ?? ""
                        ),
                        fit: BoxFit.cover
                      )
                    : null
                ),
                child: news!.urlImage!.isEmpty
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: setWidth(60),
                        vertical: setHeight(60)
                      ),
                      child: Assets.icons.iconNotfound.svg(
                          width: setWidth(60),
                          height: setHeight(60)
                        ),
                    )
                  : const SizedBox(),
              ),
            )
    
    
          ],
        ),
      ),
    );
  }
}
