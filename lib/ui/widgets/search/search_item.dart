import 'package:flutter/material.dart';
import 'package:kabarpagi/ui/constant/constant.dart';
import 'package:kabarpagi/ui/constant/themes.dart';

class SearchItem extends StatelessWidget {
  final Function(String)? onChange;
  final Function(String)? onSubmit;
  final TextEditingController controller;
  final bool readOnly;
  final bool autoFocus;
  const SearchItem({
    Key? key,
    required this.controller,
    this.onChange,
    this.onSubmit,
    this.readOnly = false,
    required this.autoFocus,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: isDarkTheme(context) ? Colors.white : grayColor.withOpacity(0.2),
        border: Border.all(
          color: Colors.black12.withOpacity(0.05),
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: setWidth(40),
        ),
        child: Row(
          children: <Widget>[
            const Icon(
              Icons.search,
              size: 20,
              color: Colors.black54,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: TextField(
                controller: controller,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                readOnly: readOnly,
                autofocus: autoFocus,
                style: styleSubtitle.copyWith(
                  fontSize: setFontSize(35)
                ),
                onChanged: (value) => onChange != null ? onChange!(value) : {},
                onSubmitted: (value) => onSubmit != null ? onSubmit!(value) : {},
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    bottom: setHeight(20)
                  ),
                  hintText: "Cari Berita",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
