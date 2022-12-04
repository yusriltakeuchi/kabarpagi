// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kabarpagi/core/providers/theme/theme_provider.dart';
import 'package:kabarpagi/core/utils/navigation/navigation_utils.dart';
import 'package:kabarpagi/injector.dart';
import 'package:kabarpagi/ui/constant/constant.dart';
import 'package:kabarpagi/ui/constant/themes.dart';
import 'package:kabarpagi/ui/router/route_list.dart';
import 'package:kabarpagi/ui/router/router_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /// Setup injector
  await setupLocator();
  await ScreenUtil.ensureScreenSize();
  await initializeDateFormatting("id", null);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {

  /// Creating precache assets
  void precacheAssets() async {
    final manifestJson = await rootBundle.loadString('AssetManifest.json');
    final rawAssets = json.decode(manifestJson) as Map<String, dynamic>;
    final images = rawAssets.keys.where((String key) => key.startsWith('assets/images')).toList();
    final icons = rawAssets.keys.where((String key) => key.startsWith('assets/icons')).toList();
    List<String> assets = [];
    assets.addAll(images);
    assets.addAll(icons);

    for (var asset in assets) {
      try {
        if (asset.contains(".png")) {
          precacheImage(AssetImage(asset), context);
        } else if (asset.contains(".svg")) {
          precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, asset), null);
        }
      } catch(e) {
        debugPrint("ERROR: $e");
        continue;
      }
    }
  }

  @override
  void didChangeDependencies() {
    precacheAssets();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Kabar Pagi',
      navigatorKey: locator<NavigationUtils>().navigatorKey,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      builder: (ctx, child) {
        setupScreenUtil(ctx);
        return MediaQuery(
          data: MediaQuery.of(ctx).copyWith(
            textScaleFactor: 1.0
          ),
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: child!,
          ),
        );
      },
      initialRoute: routeHome,
      onGenerateRoute: RouterGenerator.generate,
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}