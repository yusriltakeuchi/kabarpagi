import 'package:flutter/material.dart';

import 'package:kabarpagi/ui/constant/constant.dart';
import 'package:kabarpagi/ui/constant/themes.dart';

class ChipItem extends StatelessWidget {
  final String name;
  final VoidCallback onClick;
  const ChipItem({
    Key? key,
    required this.name,
    required this.onClick,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: grayColor.withOpacity(0.15)
      ),
      child: Material(
        type: MaterialType.transparency,
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onClick(),
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: setWidth(40),
              vertical: setHeight(10)
            ),
            child: Text(
              name,
              style: styleSubtitle.copyWith(
                color: isDarkTheme(context) ? Colors.white : blackColor,
                fontSize: setFontSize(30)
              ),
            ),
          ),
        ),
      ),
    );
  }
}
