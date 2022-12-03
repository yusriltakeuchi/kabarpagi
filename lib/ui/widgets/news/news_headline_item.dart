import 'package:flutter/material.dart';

import 'package:kabarpagi/core/models/news/news_model.dart';
import 'package:kabarpagi/gen/assets.gen.dart';
import 'package:kabarpagi/ui/constant/constant.dart';

class NewsHeadLineItem extends StatelessWidget {
  final NewsModel? news;
  final VoidCallback onClick;
  const NewsHeadLineItem({
    Key? key,
    required this.news,
    required this.onClick,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Container(
        width: deviceWidth,
        decoration: BoxDecoration(
          color: grayColor,
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: NetworkImage(
              news?.urlImage ?? "",
            ),
            fit: BoxFit.cover
          )
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    blackColor.withOpacity(0.5),
                    blackColor.withOpacity(0.3),
                    blackColor.withOpacity(0.4),
                    blackColor.withOpacity(0.8),
                  ]
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: setHeight(40),
                horizontal: setWidth(40)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
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
                  const Spacer(),
                  Text(
                    news?.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: styleTitle.copyWith(
                      fontSize: setFontSize(48),
                      color: Colors.white
                    ),
                  ),
                  SizedBox(
                    height: setHeight(20),
                  ),
                  Row(
                    children: [
                      Assets.icons.iconUser.svg(
                        width: setWidth(50),
                        height: setHeight(50),
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: setWidth(20),
                      ),
                      Text(
                        news?.author ?? "",
                        style: styleSubtitle.copyWith(
                          fontSize: setFontSize(35),
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
