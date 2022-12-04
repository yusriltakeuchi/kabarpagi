import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kabarpagi/core/providers/theme/theme_provider.dart';
import 'package:kabarpagi/gen/assets.gen.dart';
import 'package:kabarpagi/ui/constant/constant.dart';
import 'package:kabarpagi/ui/constant/themes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkTheme(context) ? blackGrayColor : Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Pengaturan",
          style: styleTitle.copyWith(
            color: isDarkTheme(context) ? Colors.white : blackColor,
            fontSize: setFontSize(55),
          ),
        ),
      ),
      body: const SettingBody(),
    );
  }
}

class SettingBody extends ConsumerWidget {
  const SettingBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(themeProvider);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: setHeight(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _settingMenu(
            context: context,
            title: "Mode Gelap",
            description: "Mengaktifkan tema gelap menyeluruh",
            selected: isDarkTheme,
            iconPath: Assets.icons.iconDarkmode.path,
            onChange: (value) => ref.read(themeProvider.notifier).setThemeDark(value),
          )
        ],
      ),
    );
  }

  Widget _settingMenu({
    required BuildContext context,
    required String title,
    required String description,
    required bool selected,
    required String iconPath,
    required Function(bool) onChange,
  }) {
    return InkWell(
      onTap: () => onChange(!selected),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: setWidth(35), vertical: setHeight(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(
                    iconPath,
                    width: setWidth(55),
                    height: setHeight(55),
                    color: isDarkTheme(context) ? Colors.white : blackColor,
                  ),
                  SizedBox(
                    width: setWidth(30),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: styleTitle.copyWith(
                            fontSize: setFontSize(45),
                            color: isDarkTheme(context)
                                ? Colors.white
                                : blackColor,
                          ),
                        ),
                        Text(
                          description,
                          style: styleSubtitle.copyWith(
                            fontSize: setFontSize(35),
                            color: isDarkTheme(context)
                                ? Colors.white
                                : grayDarkColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CupertinoSwitch(
              value: selected,
              onChanged: (value) => onChange(value),
            )
          ],
        ),
      ),
    );
  }
}
